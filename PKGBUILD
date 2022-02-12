# Maintainer: Gino Eelen (GinoE) <gino dot eelen at one-g dot be>
# Contributor: Foxboron
# Contributor: Joakim Nylen (jnylen) <joakim at nylen dot nu> 

pkgname=jotta-cli
pkgver=0.13.55213
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

sha256sums_x86_64=('d51487e7f9c9c5e17a6ae287cb9f750ae72bbbd0eb965b5e32754a0bc0baab63')
sha256sums_i686=('1b2b55a8f89b5cadc449ceaa588c782f306fdd04fdac3f9ee8ba809ef9800709')
sha256sums_armv7h=('6eb8fbdd8a3286d5afffd3349500aef40e216b4866805e4181a9dc93b097a21c')

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

