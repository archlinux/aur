# Maintainer: Joakim Nylen (jnylen) <joakim@nylen.nu>
# Contributor: Foxboron

pkgname=jotta-cli
pkgver=0.12.50392
pkgrel=1
pkgdesc="Jottacloud command line client to back up/share your files to/on Jottacloud."
arch=('x86_64' 'i686' 'armv7h')
license=('custom: (C) Jotta AS 2018-2019')
url="http://docs.jottacloud.com/jottacloud-command-line-tool"

source=("jotta-cli.sysusers"
        "jotta-cli.tmpfiles")
source_x86_64=("https://repo.jotta.us/archives/linux/amd64/jotta-cli-${pkgver}_linux_amd64.tar.gz")
source_i686=("https://repo.jotta.us/archives/linux/x86/jotta-cli-${pkgver}_linux_x86.tar.gz")
source_armv7h=("https://repo.jotta.us/archives/linux/armhf/jotta-cli-${pkgver}_linux_armhf.tar.gz.sha256sum")

sha256sums=('236b77504910d1e9c2bec69bd73d49ce9e9ca21dfd26cf0c69a212fe370bbe2d'
            '2f686a82aafbb9b2168303907b2fe623fe4635ff314583dfb38ad747e0a0e450')

sha256sums_x86_64=('1ae5acacbb5e7d8460a5ae00525e6c20af3a79fcdfd57da6999bd98779ff736c')
sha256sums_i686=('84e7d196eb8ac2c7771ea1a8a66695bca037f950295aaae66b6e30be233d7f0f')
sha256sums_armv7h=('a997b80f02d3ea691fd495c003b39f7a5dc7ba279cac5fadf3274719bfcd47ce')

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
