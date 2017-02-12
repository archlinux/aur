# Maintainer: substanceof <vk-cli.dev[at]ya[dot]ru>
pkgname=vk-cli-git
pkgver=r1008.816dcee
pkgrel=1
pkgdesc="A console (ncurses) client for vk.com written in D (git upstream)"
arch=('x86_64' 'i686')
url="https://github.com/vk-cli/vk"
license=('Apache')
depends=('curl' 'openssl' 'ncurses>=5.7')
makedepends=('dub' 'dmd>=2.071.0' 'git' 'dtools')
optdepends=('mpv: for music playback')
provides=('vk-cli')
conflicts=('hardening-wrapper' 'vk-cli')

source=("git+https://github.com/vk-cli/vk.git")
md5sums=('SKIP')

_gitname=vk

pkgver() {
  cd "$srcdir/$_gitname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_gitname"
  dub build --config=release-shared
}

package() {
  cd "$srcdir/$_gitname"
  install -Dm755 -t "$pkgdir/usr/bin" 'vk'
}

