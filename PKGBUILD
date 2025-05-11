# Maintainer: Wolfgang Popp <mail@wolfgang-popp.de>
pkgname=ytcc-git
pkgver=r461.3a6d5ee
pkgrel=1
pkgdesc="Command line tool to keep track of playlists"
arch=('any')
url="https://github.com/woefe/ytcc"
license=('GPL3')
depends=('python-click' 'yt-dlp' 'python-wcwidth' 'python-defusedxml')
optdepends=('mpv' 'fzf' 'youtube-dl')
conflicts=('ytcc')
provides=('ytcc')
makedepends=('python-build' 'python-hatchling' 'python-installer' 'python-wheel')
source=("$pkgname::git+https://github.com/woefe/ytcc.git")
sha256sums=('SKIP')

pkgver(){
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $pkgname
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname"
  python -m installer --destdir="$pkgdir/" dist/*.whl
  ln -s "ytccf.sh" "${pkgdir}/usr/bin/ytccf"
  install -Dm644 scripts/completions/zsh/_ytcc "${pkgdir}/usr/share/zsh/site-functions/_ytcc"
  install -Dm644 scripts/completions/bash/ytcc.completion.sh "${pkgdir}/usr/share/bash-completion/completions/ytcc"
  install -Dm644 scripts/completions/fish/ytcc.fish "${pkgdir}/usr/share/fish/vendor_completions.d/ytcc.fish"
  install -Dm644 doc/ytcc.1 "${pkgdir}/usr/share/man/man1/ytcc.1"
}

# vim:set ts=2 sw=2 et:
