# Maintainer: Gino Eelen (GinoE) <gino dot eelen at one-g dot be>
# Contributor: Foxboron
# Contributor: Joakim Nylen (jnylen) <joakim at nylen dot nu> 

pkgname=jotta-cli
pkgver=0.13.53591
pkgrel=1
pkgdesc="Jottacloud command line client to back up/share your files to/on Jottacloud."
arch=('x86_64' 'i686' 'armv7h')
license=('custom: (C) Jotta AS 2018-2022')
url="http://docs.jottacloud.com/jottacloud-command-line-tool"
install="jotta-cli.install"

source=("jotta-cli.sysusers"
        "jotta-cli.tmpfiles")
source_x86_64=("https://repo.jotta.us/archives/linux/amd64/jotta-cli-${pkgver}_linux_amd64.tar.gz")
source_i686=("https://repo.jotta.us/archives/linux/x86/jotta-cli-${pkgver}_linux_x86.tar.gz")
source_armv7h=("https://repo.jotta.us/archives/linux/armhf/jotta-cli-${pkgver}_linux_armhf.tar.gz")

sha256sums=('236b77504910d1e9c2bec69bd73d49ce9e9ca21dfd26cf0c69a212fe370bbe2d'
            '2f686a82aafbb9b2168303907b2fe623fe4635ff314583dfb38ad747e0a0e450')

sha256sums_x86_64=('070311babcd1f219b79f04be702caa9033a1323ab8e02b989d65ae205756e13f')
sha256sums_i686=('c1ce23f1993fa3c46399e6bc6d1a208b3a664e032bd4780ea24aa3d7091aceff')
sha256sums_armv7h=('eb6035200b27ddce1b3174348c414a2904dd7818ee71fcdf80ad6d826482dcaa')

package() {
    install -Dm644 "${srcdir}/usr/share/jottad/systemd/default/files/etc/systemd/system/jottad.service" \
        "${pkgdir}/usr/lib/systemd/system/jottad.service"
    install -Dm644 "${srcdir}/usr/share/jottad/systemd/default/files/etc/default/jottad" \
        "${pkgdir}/etc/default/jottad"
    install -Dm644 "${srcdir}/etc/jottad/config.ini" "${pkgdir}/etc/jottad/config.ini"
    install -Dm755 "${srcdir}/usr/bin/jottad" "${pkgdir}/usr/bin/jottad"
    install -Dm755 "${srcdir}/usr/bin/jotta-cli" "${pkgdir}/usr/bin/jotta-cli"

    install -Dm644 "${srcdir}"/$pkgname.sysusers \
        "${pkgdir}"/usr/lib/sysusers.d/$pkgname.conf
    install -Dm644 "${srcdir}"/$pkgname.tmpfiles \
        "${pkgdir}"/usr/lib/tmpfiles.d/$pkgname.conf

    # chmod fixes
    chmod 755 "$pkgdir/usr/bin"
    chmod 755 "$pkgdir/etc/jottad"
    chmod 644 "$pkgdir/etc/jottad/config.ini"
}

