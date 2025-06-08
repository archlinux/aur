# Package Maintainer: Mia Furze <46620osu@gmail.com>

pkgname='ponyfetch-git'
pkgver=releases.r10.gef2a1d1
pkgrel=1
pkgdesc='Just a simple cross-platform neofetch for all the bronies out there.'
arch=('any')
url="https://github.com/Atsukoro1/ponyfetch"
provides=('ponyfetch')
conflicts=('ponyfetch')
depends=('rust'
         'inetutils'
	 'xorg-xrandr'
)
license=('GPL2')
source=("$pkgname::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
    cd "$pkgname"
    cargo build --release
}

package() {
    cd "$pkgname"
    install -D -m755 "target/release/ponyfetch" "${pkgdir}/usr/bin/ponyfetch"
}

