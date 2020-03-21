# Maintainer: Joakim Nylen (jnylen) <joakim@nylen.nu>
# Contributor: Foxboron

pkgname=jotta-cli
pkgver=0.6.24251
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

sha256sums_x86_64=('7aa30a3fbd0a49f7ee7564715783999a52155ffa552d7f2e97c869a66da6f213')
sha256sums_i686=('32f5bf432cbf05b92e6c1aad5c6aca1388426472ecb43d7a2dc38950c10d3087')
sha256sums_armv7h=('742fc09587eb38a2eb01cbe660d1dbec32426160f76cf6df4963ebac7416c781')

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
