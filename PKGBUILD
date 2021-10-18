# Maintainer: Giedrius Statkevičius <giedrius.statkevicius@gmail.com>

pkgname=twitchnotifier-git
pkgver=20201013
pkgrel=1
pkgdesc='A tool that sits in the background and notifies you using libnotify if a channel you follow comes online or goes offline'
arch=('any')
url='https://github.com/GiedriusS/TwitchNotifier'
license=('GPL3')
depends=('python-requests' 'libnotify' 'python-gobject')
makedepends=('git')
source=(git+https://github.com/GiedriusS/TwitchNotifier.git)
md5sums=('SKIP')
install=TwitchNotifier.install

pkgver() {
 cd TwitchNotifier
 git log -1 --format='%cd' --date=short | tr -d -- '-'
}

build() {
 cd TwitchNotifier
 python setup.py build
}

package() {
 cd TwitchNotifier
 python setup.py install --root="$pkgdir" --optimize=1
 mkdir -p "$pkgdir"/usr/share/doc/TwitchNotifier
 install -m644 twitchnotifier.cfg "$pkgdir"/usr/share/doc/TwitchNotifier
}
