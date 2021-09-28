# Maintainer: goetzc
pkgname=seeker
pkgver=2.0
pkgrel=2
pkgdesc='Utility to find out the storage medium access time (latency)'
arch=(x86_64)
url="http://linuxinsight.com/how_fast_is_your_disk.html"
license=('GPL2')
depends=('gcc')
# original source http://linuxinsight.com/sites/default/files/$pkgname.c gone
source=('https://gist.githubusercontent.com/johnlane/9862846d7ee48a5b351e350f1418b9b1/raw/32eabe1b535f33e33cbb8bda9671b763d4a7d6b0/seeker.c'
        '0001-seeker-support-disks-2TiB.patch')
sha256sums=('6b7aaf278db36a7eb27e54e3abed23dab3c4594acf87d592e626df8432ec1b54'
            '2ab24d77ead2bfc50f477842e9f012671ad5bf8e97d4171921d67353120cd0ba')

prepare() {
    patch --follow-symlinks -Np2 < 0001-seeker-support-disks-2TiB.patch
}

build() {
    gcc -O2 $pkgname.c -o $pkgname
}

package() {
    install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}
