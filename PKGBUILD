# Maintainer: Yangtse Su <yangtsesu@gmail.com>
_pkgname=libretro-melondsds
pkgname=$_pkgname-bin
pkgver=1.4.0
pkgrel=2
pkgdesc="An enhanced remake of the melonDS core for libretro"
arch=('x86_64' 'aarch64')
url="https://github.com/JesseTG/melonds-ds"
license=('GPL-3.0-or-later')
groups=('libretro')
depends=('libgl' 'libretro-core-info')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source_x86_64=("${_pkgname}_${arch}_${pkgver}.zip::${url}/releases/download/v${pkgver}/melondsds_libretro-linux-${arch}-Release.zip")
source_aarch64=("${_pkgname}_arm64_${pkgver}.zip::${url}/releases/download/v${pkgver}/melondsds_libretro-linux-arm64-Release.zip")
b2sums_x86_64=('711301b2a092a73eb5f4e0cc035c4634a81c0091c1af8fdccecd889c0de2560a96134677dc6a2aeb1377077f97f64ae99454f5cfb8243b2e0de7bdf1ef6101ec')
b2sums_aarch64=('7d10af89b49b2bb87addb2a1ce7b834fdf3bccb7f3799d65a0ec6a38a6c345265d2acdabc932bc9ba2520679454d94d12618d60fca1a8f2029c26a9624e86f63')

package() {
        _arch=${CARCH}
        if [ "${CARCH}" = "aarch64" ]; then
          _arch=arm64
        fi
        _pkg=melondsds_libretro-linux-${_arch}-Release

	install -Dm644 -t "$pkgdir"/usr/lib/libretro "${srcdir}/${_pkg}/cores/melondsds_libretro.so"
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname "${srcdir}/${_pkg}/cores/melondsds-LICENSE.txt"
}
