# Maintainer: Anty0 <anty150 at gmail dot com>

pkgname='python-zulip-term-git'
_pkgname='zulip-terminal'
pkgver=0.6.0.r539.a9d354c608
pkgrel=1
pkgdesc="An interactive terminal interface for Zulip"
arch=('any')
url="https://github.com/zulip/zulip-terminal"
license=('GPL')
depends=('python'
         'python-urwid'
         'python-urwid_readline'
         'python-lxml'
         'python-beautifulsoup4'
         'python-zulip-api'
         'python-typing_extensions'
         'python-dateutil'
         'python-tzlocal'
         'python-pygments'
         'python-pytz'
         'python-pyperclip')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-pytest-mock' 'python-pytest-cov')
provides=('python-zulip-term')
conflicts=('python-zulip-term')
source=('git+https://github.com/zulip/zulip-terminal#branch=main')
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "%s" "$(git describe --tags | sed 's/^v//; s/-/.r/; s/-g/./')"
}

prepare() {
  cd "$srcdir/$_pkgname"
}

build() {
  cd "$srcdir/$_pkgname"
  python setup.py build
}

check(){
  cd "$srcdir/$_pkgname"
  pytest
}

package() {
  cd "$srcdir/$_pkgname"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
