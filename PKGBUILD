pkgname=brscan-skey
pkgver=0.2.4_1
pkgrel=9
pkgdesc='Brother scan-key-tool'
arch=('i686' 'x86_64')
url='http://support.brother.com/g/s/id/linux/en'
license=('custom:Brother')
optdepends=('sane: for all default scanning scripts'
            'sendmail: for default "Scan to email" script'
            'gimp: for default "Scan to image" script'
            'cuneiform: for default "Scan to OCR" script')
install=brscan-skey.install

source_i686=("http://www.brother.com/pub/bsc/linux/dlf/${pkgname}-${pkgver/_/-}.i386.rpm")
md5sums_i686=('c6bc7a501f424541130a1b9a38b76493')

source_x86_64=("http://www.brother.com/pub/bsc/linux/dlf/${pkgname}-${pkgver/_/-}.x86_64.rpm")
md5sums_x86_64=('9ad29a0ef9f8f4d6f742fb4293ee08a6')

source=('brscan-skey.service' 'brscan-skey-user.service' 'LICENSE.html')
md5sums=('82ba4e7cf73306b17f144731f6484ad0' 'da65d820642f760115428769d2639db9' 'bd06a5d28abb3b3a3a6a263567cbb78b')

package() {
    cp -R "$srcdir"/opt "$pkgdir"

    install -d -m755 "$pkgdir"/usr/lib/systemd/system
    install -D -m644 "$srcdir"/brscan-skey.service "$pkgdir"/usr/lib/systemd/system

    install -d -m755 "$pkgdir"/usr/lib/systemd/user
    install -D -m644 "$srcdir"/brscan-skey-user.service "$pkgdir"/usr/lib/systemd/user/brscan-skey.service

    install -d -m755 "$pkgdir"/usr/share/licenses/$pkgname
    install -D -m644 "$srcdir"/LICENSE.html "$pkgdir"/usr/share/licenses/$pkgname

    install -d "$pkgdir"/srv
    install -d -m 775 -o 289 -g 289 "$pkgdir"/srv/brscan-skey
}
