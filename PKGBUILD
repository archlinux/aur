# Maintainer: mia <mia@mia.jetzt>

pkgname='skytable-bin'
pkgver='0.8.0_beta_1'
pkgrel='2'
pkgdesc='Skytable is a modern NoSQL database powered by BlueQL'
arch=('x86_64')
url='https://skytable.io'
license=('AGPL-3.0-only')
provides=('skytable')
_repo='https://github.com/skytable/skytable'
_dlver='v0.8.0-beta'
_pkgfile="skytable-${_dlver}-${arch}-linux-gnu.deb"
source=("${_repo}/releases/download/${_dlver}/${_pkgfile}"
        'skytable.tmpfiles'
        'skytable.sysusers')
noextract=("${_pkgfile}")
sha256sums=('d8ebce8e9f19d950d21abaceb0e9a27ef0b0730d9e54996921fdcf7108c10531'
            '1707e36c4613020bdbf2a0a33afd130d30b4e0b615831ba06eaadbe865e86156'
            'd04ba945687bd3c0dd8ccfec8dbb06808e89169b11225aedf6df85373058330d')

prepare() {
    ar x "${_pkgfile}" data.tar.xz
    tar xf data.tar.xz
}

package() {
    install -Dm 755 "${srcdir}/usr/bin/skyd" "${pkgdir}/usr/bin/skyd"
    install -Dm 755 "${srcdir}/usr/bin/skysh" "${pkgdir}/usr/bin/skysh"
    install -Dm 755 "${srcdir}/usr/bin/sky-bench" "${pkgdir}/usr/bin/sky-bench"

    install -Dm 644 "skytable.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/skytable.conf"
    install -Dm 644 "skytable.sysusers" "${pkgdir}/usr/lib/sysusers.d/skytable.conf"
    install -Dm 644 "${srcdir}/usr/share/doc/skytable/copyright" "${pkgdir}/usr/share/doc/skytable/copyright"

    install -Dm 644 "${srcdir}/etc/systemd/system/skyd.service" "${pkgdir}/etc/systemd/system/skyd.service"

    install -Dm 644 "${srcdir}/var/lib/skytable/config.yaml.tmp" "${pkgdir}/var/lib/skytable/config.yaml"
}
