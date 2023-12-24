# Maintainer: Mia Furze <46620osu@gmail.com>

pkgname='vodbot-git'
pkgver=1.1.10.r0.g376e311
pkgrel=1
pkgdesc='A command line interface VOD and Clip manager for Twitch.'
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/FriendTeamInc/VodBot"
provides=('vodbot')
conflicts=('vodbot')
depends=('ffmpeg'
         'python-argcomplete'
         'python-dataclasses-json' # AUR
         'python-requests'
         'python-m3u8' # AUR
         'python-google-api-python-client'
         'python-google-auth-oauthlib'
         'python-google-auth-httplib2'
         'python-pillow'
         'python-discord-webhook' # AUR
)
license=('MIT')
source=("$pkgname::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
    cd "$pkgname"
    python setup.py build
}

package() {
    cd "$pkgname"
    python setup.py install --root="${pkgdir}/"
}
