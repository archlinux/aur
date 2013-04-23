# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Author: ody

pkgname=pacman-cage
pkgver=2.9.9
pkgrel=7
pkgdesc="Creates a loopbacked filesystem to give better response times when using pacman."
arch=(any)
url=http://bbs.archlinux.org/viewtopic.php?id=20385
license=(GPL3)
install=$pkgname.install
source=($pkgname
	pacman-uncage
	backup_pacmandb.cron
	pacmandb.service)
sha256sums=('f78d0a9fbd9cb73a0bf6e2c2bc0e305b878154e62a61d770640f1af7233f79a7'
            'ef9d1d4ab44d1d5b33c4c52572d7757a4c231a657b51b7f620cd23769b97dd8e'
            'c4476eb20edf4ba88e06bf25d47c575c7567d431a60aa6d6d6b8a7107f633987'
            '861f7569cc4c5c21d0415cfd44187bc464ae80e2202c4981c1fd7e19fbca9d72')
sha512sums=('c398440af579b744096a494cc48a8cb9b75815cf48076e384251747103796a75e09f5d2769749000d4941a33ac0083398fc29a0d54d24601d3e7ce30ea7bf943'
            '9b8f974b269dd9190216ad5decb61db906ac82a4c63b78b39cc44a6e62d787f7cb28e09544d3c23218023e75b74f3d9142ec27107299391b62b8fa21d7a5343a'
            '3f45e140979040373c82eeb4a63cf138d776e11e461f1268dbb736e780f82a4b189134d36bd4dae32ce81d3c130f0f3aa554cb3f48b16d0b676ff4ffd6eeb4bb'
            '0c78094aa69abfb5d409a1ee98f4241ddfc6cf7c73b1ccae01df21b37b72970d6ad424d1bb983ae77992b13608b8adee10b3f689b3fd037d3f0638c5d9806d11')

package() {
    cd "$srcdir"
    install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
    install -Dm755 pacman-uncage "$pkgdir"/usr/bin/pacman-uncage
    install -Dm644 pacmandb.service "$pkgdir"/usr/lib/systemd/system/pacmandb.service

    ## Choose one if you wish to install the cron backup script.
    ## You also might want to change the backup dir inside the script.
    #install -Dm755 backup_pacmandb.cron "$pkgdir"/etc/cron.hourly/backup_pacmandb
    #install -Dm755 backup_pacmandb.cron "$pkgdir"/etc/cron.daily/backup_pacmandb
}
