# Maintainer: BlackFuffey <fluffistical@gmail.com>

pkgname=(dewlock-bin)
pkgdesc='A minimal, beautiful screen locker for Wayland.'
url='https://github.com/shikaan/dewlock'
license=(MIT)

pkgver=0.1.0
pkgrel=1

arch=(x86_64 aarch64)

depends=('glibc>=2.34' 'cairo>=1.2.4' 'pam>=0.99.7.1' 'wayland>=1.20.0' 'libxkbcommon>=0.5.0')
makedepends=(binutils tar)
provides=(dewlock)

source_x86_64=(dewlock-x86_64-${pkgver}.deb::"${url}/releases/download/v0.1.0/dewlock-amd64.deb")
sha256sums_x86_64=('be54166503428e7129a3d04022132b4ccd0e80412b0e1cf8df44035c4c4e141b')
sha256sums_aarch64=('8c1bcde24684c7abfcd606b2e3ae4af059e8968b7e1e458584a44edacfb154ba')

source_aarch64=(dewlock-aarch64-${pkgver}.deb::"${url}/releases/download/v0.1.0/dewlock-arm64.deb")

prepare() {
    ar x "./dewlock-${CARCH}-${pkgver}.deb"
    tar --zstd -xf "./data.tar.zst"
    tar --zstd -xf "./control.tar.zst"
}

package() {
        mapfile -t backup < "./conffiles"
	cp -r etc usr "$pkgdir"
}
