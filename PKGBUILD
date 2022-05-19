# Maintainer: David Gonzalez <neko.eth0 AT gmail DOT com>
# Contributor: Rob Cornish <jrmcornish AT gmail DOT com>
pkgname=brscan-skey
pkgver=0.3.1_2
pkgrel=2
pkgdesc='Brother scan-key-tool'
arch=('i686' 'x86_64')
url='http://support.brother.com/g/s/id/linux/en'
license=('custom:Brother')
optdepends=('sane: for all default scanning scripts'
            'sendmail: for default "Scan to email" script'
            'gimp: for default "Scan to image" script'
            'cuneiform: for default "Scan to OCR" script')
install=brscan-skey.install

source_i686=("http://download.brother.com/welcome/dlf006649/$pkgname-${pkgver/_/-}.i386.rpm")
sha256sums_i686=('685abebc798cd9823c1b7bdb0d81b4b16a0d651d92dc8688644fc4f42b8fef6b')

source_x86_64=("http://download.brother.com/welcome/dlf006650/$pkgname-${pkgver/_/-}.x86_64.rpm")
sha256sums_x86_64=('3a334b848a9fb018782f49fc6fd4d149387d0dd5460afa9d66bcb2df7ed0c553')

source=('brscan-skey.service' 'brscan-skey-user.service' 'LICENSE.html')
sha256sums=('80d1d92f71381c160a93ddac1bfcde1e7922dc84332f1f7561c6d328af7e7219'
            '511e49ac6618f2c11e5ed3a4ce4c235bd5d46faa584974f318447b117759651a'
            'd6ea4fdfb4b9009b105924ba3fd9c55b7487964cc07ba0cf2a2aa4e691c00e6a')

package() {
    cp -r "$srcdir"/opt "$pkgdir"

    install -d -m755 "$pkgdir"/usr/lib/systemd/system
    install -D -m644 "$srcdir"/brscan-skey.service "$pkgdir"/usr/lib/systemd/system

    install -d -m755 "$pkgdir"/usr/lib/systemd/user
    install -D -m644 "$srcdir"/brscan-skey-user.service "$pkgdir"/usr/lib/systemd/user/brscan-skey.service

    install -d -m755 "$pkgdir"/usr/share/licenses/$pkgname
    install -D -m644 "$srcdir"/LICENSE.html "$pkgdir"/usr/share/licenses/$pkgname

    install -d "$pkgdir"/srv
    install -d -m 775 -o 289 -g 289 "$pkgdir"/srv/brscan-skey
}
