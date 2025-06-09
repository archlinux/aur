# Maintainer: tioguda  <guda.flavio@gmail.com>
# Contributor: barnabedikartola
# Contributor: Bruno Goncalves <bigbruno@gmail.com>

pkgbase=waydroid-biglinux
pkgname=${pkgbase}-git
pkgver=r25.f84180a
pkgrel=1
arch=('any')
license=('GPL')
url="https://github.com/biglinux/waydroid-biglinux"
pkgdesc="Simplify waydroid usage"
makedepends=('git')
source=("git+https://github.com/biglinux/waydroid-biglinux.git")
sha512sums=('SKIP')

pkgver() {
    cd ${srcdir}/${pkgbase}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    depends=('waydroid' 'python-pyclip' 'bigbashview' 'yad' 'weston')
    provides=("${pkgbase}")
    conflicts=("${pkgbase}")

    install -D -m0755 "${srcdir}/${pkgbase}/usr/bin/waydroid-big" "${pkgdir}/usr/bin/waydroid-big"
    install -D -m0755 "${srcdir}/${pkgbase}/usr/bin/waydroid-open" "${pkgdir}/usr/bin/waydroid-open"
    install -D -m0755 "${srcdir}/${pkgbase}/usr/bin/waydroid-big-3d" "${pkgdir}/usr/bin/waydroid-big-3d"
    install -D -m0755 "${srcdir}/${pkgbase}/usr/bin/waydroid-big-start" "${pkgdir}/usr/bin/waydroid-big-start"
    install -D -m0755 "${srcdir}/${pkgbase}/usr/bin/waydroid-list-apps" "${pkgdir}/usr/bin/waydroid-list-apps"
    install -D -m0755 "${srcdir}/${pkgbase}/usr/bin/waydroid-open-wait" "${pkgdir}/usr/bin/waydroid-open-wait"

    install -D -m0644 "${srcdir}/${pkgbase}/usr/share/applications/waydroid-open.desktop" "${pkgdir}/usr/share/applications/waydroid-open.desktop"

    install -D -m0644 "${srcdir}/${pkgbase}/usr/share/libalpm/hooks/waydroid-biglinux.hook" "${pkgdir}/usr/share/libalpm/hooks/waydroid-biglinux.hook"
    install -D -m0644 "${srcdir}/${pkgbase}/usr/share/libalpm/hooks/weston-session-remove.hook" "${pkgdir}/usr/share/libalpm/hooks/weston-session-remove.hook"
    install -D -m0644 "${srcdir}/${pkgbase}/usr/share/libalpm/hooks/waydroid-biglinux-remove.hook" "${pkgdir}/usr/share/libalpm/hooks/waydroid-biglinux-remove.hook"

    install -D -m0755 "${srcdir}/${pkgbase}/usr/share/libalpm/scripts/waydroid-biglinux" "${pkgdir}/usr/share/libalpm/scripts/waydroid-biglinux"
    install -D -m0755 "${srcdir}/${pkgbase}/usr/share/libalpm/scripts/waydroid-biglinux-remove" "${pkgdir}/usr/share/libalpm/scripts/waydroid-biglinux-remove"

    install -D -m0644 "${srcdir}/${pkgbase}/usr/share/waydroid-extra/loading-android.png" "${pkgdir}/usr/share/waydroid-extra/loading-android.png"
    install -D -m0644 "${srcdir}/${pkgbase}/usr/share/waydroid-extra/loading-android.jpg" "${pkgdir}/usr/share/waydroid-extra/loading-android.jpg"

    mkdir -p "${pkgdir}/usr/share/locale"
    cp -r "${srcdir}/${pkgbase}"/usr/share/locale/* "${pkgdir}/usr/share/locale/"
}
