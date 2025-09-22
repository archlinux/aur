pkgname=gnome-shell-extension-screen-autorotate
pkgver=26
_pkgver=26
pkgrel=1
pkgdesc="A GNOME extension to auto-rotate screen regardless of touch mode"
arch=("any")
url="https://github.com/shyzus/gnome-shell-extension-screen-autorotate"
license=("GPL")
depends=("gnome-shell" "iio-sensor-proxy")
conflicts=("gnome-shell-extension-screen-autorotate-git")
source=("$pkgname-${_pkgver}.tar.gz::$url/archive/v${_pkgver}.tar.gz")
sha256sums=('7e384c17221b7702ceb2887a275ecbe38814c933e04d4be02b1122e6065cb4d5')

_uuid="screen-rotate@shyzus.github.io"

prepare() {
    source_dir="$srcdir/$pkgname-${_pkgver}"
    cd "$source_dir"
    local src
    for src in "${source[@]}"; do
        src="${src%%::*}"
        src="${src##*/}"

        [[ $src = *.patch ]] || continue
        echo "Applying patch $src..."
        patch -Np1 < "../$src"
    done
}

package() {

  source_dir="$srcdir/$pkgname-${_pkgver}/$_uuid"

  install -dm755 "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"
  install -Dm755 -t "${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}" "${source_dir}"/*.*

  install -dm755 "${pkgdir}/usr/share/glib-2.0/schemas"
  install -Dm644 -t "${pkgdir}/usr/share/glib-2.0/schemas" "${source_dir}/schemas"/*.xml

}