# Maintainer: Joakim Nylen (jnylen) <joakim@nylen.nu>
# Contributor: Foxboron

pkgname=jotta-cli
pkgver=0.9.39536
pkgrel=1
pkgdesc="Jottacloud command line client to back up/share your files to/on Jottacloud."
arch=('x86_64' 'i686' 'armv7h')
license=('custom: (C) Jotta AS 2018-2019')
url="http://docs.jottacloud.com/jottacloud-command-line-tool"

source=("jotta-cli.sysusers"
        "jotta-cli.tmpfiles")
source_x86_64=("https://repo.jotta.us/debian/pool/main/j/jotta-cli/jotta-cli_${pkgver}_amd64.deb")
source_i686=("https://repo.jotta.us/debian/pool/main/j/jotta-cli/jotta-cli_${pkgver}_i386.deb")
source_armv7h=("https://repo.jotta.us/debian/pool/main/j/jotta-cli/jotta-cli_${pkgver}_armhf.deb")

sha256sums=('236b77504910d1e9c2bec69bd73d49ce9e9ca21dfd26cf0c69a212fe370bbe2d'
            '2f686a82aafbb9b2168303907b2fe623fe4635ff314583dfb38ad747e0a0e450')

sha256sums_x86_64=('516d74090d7fd54733bbdd4c156447d142a60acdfb83577f8ca6e175bc52aae5')
sha256sums_i686=('9f024775f4c49b283a7c8a479f58d958febd4f5c712e7d424a5d6ad4e0b656f6')
sha256sums_armv7h=('b78b1dd2da899cf08b0e07e28b502c24525c7d72d6119360de4f57090b58deaf')

package() {
    cd ${srcdir}
    tar -xvf data.tar.gz -C ${pkgdir} --exclude='./control'

    install -Dm644 "${pkgdir}/usr/share/jottad/systemd/default/files/etc/systemd/system/jottad.service" \
        "${pkgdir}/usr/lib/systemd/system/jottad.service"
    install -Dm644 "${pkgdir}/usr/share/jottad/systemd/default/files/etc/default/jottad" \
        "${pkgdir}/etc/default/jottad"
    rm -rf "${pkgdir}/usr/share/jottad"

    install -Dm644 "${srcdir}"/$pkgname.sysusers \
        "${pkgdir}"/usr/lib/sysusers.d/$pkgname.conf
    install -Dm644 "${srcdir}"/$pkgname.tmpfiles \
        "${pkgdir}"/usr/lib/tmpfiles.d/$pkgname.conf

    # chmod fixes
    chmod 755 "$pkgdir/usr/bin"
    chmod 755 "$pkgdir/etc/jottad"
    chmod 644 "$pkgdir/etc/jottad/config.ini"
}
