# Maintainer: ZauJulio <zaujulio.dev@gmail.com>
pkgname=linuwu-sense-dkms
pkgver=1.0.0
pkgrel=1
pkgdesc="Acer Laptop WMI Extras Driver (DKMS) with clang/gcc support for options"
arch=('any')
url="https://github.com/0x7375646F/Linuwu-Sense"
license=('GPL')
depends=('dkms')
optdepends=('linux-headers: for standard kernel' 'linux-lts-headers: for lts kernel' 'linux-cachyos-headers: for cachyos' 'linux-zen-headers: for zen kernel' 'linux-hardened-headers: for hardened kernel' 'linux-ck-headers: for ck kernel' 'linux-xanmod-headers: for xanmod kernel' 'linux-rt-headers: for real-time kernel' 'linux-bfq-headers: for bfq scheduler kernel' 'linux-xanmod-rt-headers: for xanmod real-time kernel' 'clang: to build with clang compiler support' 'gcc: to build with gcc compiler support')
makedepends=('git')
install=linuwu-sense.install
source=("git+https://github.com/0x7375646F/Linuwu-Sense.git"
        "dkms.conf"
        "linuwu-sense.hook"
        "linuwu-sense-setup.sh"
        "linuwu-sense-check.sh")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

package() {
    # 1. Install Source to /usr/src
    install -d "$pkgdir/usr/src/linuwu-sense-$pkgver"
    cp -r "$srcdir/Linuwu-Sense/"* "$pkgdir/usr/src/linuwu-sense-$pkgver/"
    
    # 2. Install dkms.conf
    install -Dm644 dkms.conf "$pkgdir/usr/src/linuwu-sense-$pkgver/dkms.conf"
    
    # 3. Install helper scripts
    install -Dm755 linuwu-sense-setup.sh "$pkgdir/usr/bin/linuwu-sense-setup.sh"
    install -Dm755 linuwu-sense-check.sh "$pkgdir/usr/bin/linuwu-sense-check.sh"
    
    # 4. Install Pacman Hook
    install -Dm644 linuwu-sense.hook "$pkgdir/usr/share/libalpm/hooks/linuwu-sense.hook"
}
