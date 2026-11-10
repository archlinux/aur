# PKGBUILD

# Maintainer: Daniele Fucini <dfucini [at] gmail [dot] com>

pkgname=update-notify
pkgver=3.13
pkgrel=2
pkgdesc='Desktop notifications for pending repo and AUR updates'
arch=('any')
url="https://git.shouldnt.work/fuxino/$pkgname"
license=('GPL-3.0-or-later')
depends=('pacman-contrib'
         'libnotify')
makedepends=('git')
checkdepends=('bats'
              'bats-assert'
              'bats-support')
optdepends=('aurutils: to check AUR packages in the local repo for updates'
            'fwupd: to check for firmware updates'
            'git-monitor: to check git repos for updates')
source=("git+$url?signed#tag=$pkgver")
validpgpkeys=('7E12BC1FF3B6EDB2CD8053EB981A2B2A3BBF5514')
sha256sums=('56bfe7f4a8f8d5c311fe6c7c07f01614111e5c899043d038ce0a1c11362b4a71')

check()
{
    cd "$srcdir"/"$pkgname"
    bats tests
}

package()
{
    cd "$srcdir"/"$pkgname"
    install -Dm755 "$pkgname" "$pkgdir"/usr/bin/"$pkgname"
    install -Dm644 "$pkgname".service "$pkgdir"/usr/lib/systemd/user/"$pkgname".service
    install -Dm644 "$pkgname"-quiet.service "$pkgdir"/usr/lib/systemd/user/"$pkgname"-quiet.service
    install -Dm644 "$pkgname".timer "$pkgdir"/usr/lib/systemd/user/"$pkgname".timer
    install -Dm644 "$pkgname".path "$pkgdir"/usr/lib/systemd/user/"$pkgname".path
    install -Dm644 README.md "$pkgdir"/usr/share/doc/"$pkgname"/README.md
    install -Dm644 config.example "$pkgdir"/usr/share/doc/"$pkgname"/config.example
}
