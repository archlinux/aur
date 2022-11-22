# Maintainer: Xinc
# Original Maintainers: György Balló <ballogy@freestart.hu> Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=unity-asset-pool
_actual_ver=0.8.24
_extra_ver=+17.10.20170507
pkgver=${_actual_ver}${_extra_ver/\+/.}
pkgrel=1
pkgdesc="Design assets for Unity"
arch=(any)
url="https://launchpad.net/unity-asset-pool"
license=(GPL)
depends=(adwaita-icon-theme)
makedepends=(icon-naming-utils)
source=("https://launchpad.net/ubuntu/+archive/primary/+files/unity-asset-pool_${_actual_ver}${_extra_ver}.orig.tar.gz")
sha512sums=('SKIP')

package() {
    install -dm755 "${pkgdir}/usr/share/unity/themes/"
    install -m644 launcher/* "${pkgdir}/usr/share/unity/themes/"
    install -m644 panel/* "${pkgdir}/usr/share/unity/themes/"

    install -dm755 "${pkgdir}/usr/share/icons/"
    find unity-icon-theme/ -type f -exec install -Dm644 {} "${pkgdir}"/usr/share/icons/{} \;

    # From debian/rules
    for i in $(find "${pkgdir}/usr/share/icons" -mindepth 2 -maxdepth 2 -type d); do
        cd "${i}"
        for j in *; do
            /usr/lib/icon-naming-utils/icon-name-mapping -c "${j}"
        done
    done
}
