# -*- sh -*-

# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# Contributor: Anna Vyalkova <cyber AT sysrq DOT in>

pkgname='offpunk-git'
_pkgname='offpunk'
epoch=5
pkgver=2.2.r14.g469311b
pkgrel=3
pkgdesc='Fork of the command-line Gemini client AV-98 with added offline capabilities (built from latest commit)'
arch=('any')
url='https://git.sr.ht/~lioploum/offpunk'
license=('AGPL-3.0-or-later')  # SPDX-License-Identifier: AGPL-3.0-or-later
depends=(
  'file'
  'less'
  'python'
  'python-beautifulsoup4'
  'python-chardet'
  'python-cryptography'
  'python-feedparser'
  'python-lxml-html-clean'
  'python-pillow'
  'python-readability-lxml'
  'python-requests'
  'python-setproctitle'
)
makedepends=(
  'coreutils'
  'git'
  'python-build'
  'python-hatchling'
  'python-installer'
  'python-wheel'
)
optdepends=(
  'chafa: chafa and ansiwrap are required to render images in terminal'
  'timg: view images and videos in the terminal'
  'wl-clipboard: copies text to  the Wayland clipboard'
  'xdg-utils: xdg-open opens a URL in the preferred application'
  'xclip: copies text to the X11 clipboard'
  'xsel: copies text to the X11 clipboard'
)
provides=('offpunk')
conflicts=('offpunk')
source=("git+$url")
noextract=("$_pkgname")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"

  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

build() {
  cd "$_pkgname"

  python -m build --wheel --no-isolation
}

package() {
  cd "$_pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname" \
    CHANGELOG CONTRIBUTORS README.md
  install -vDm0644 -t "$pkgdir/usr/share/man/man1" \
    man/*.1
}

# eof
