# Maintainer: Nahuel Morata <nahuelmorata@gmail.com>
pkgname=drivesync-git
_origname="drivesync"
pkgver=1.2.0
pkgrel=1
pkgdesc="A command line utility that synchronizes your Google Drive files with a local folder on your machine"
arch=('any')
url="https://github.com/MStadlmeier/drivesync"
license=('MIT')
depends=("ruby")
provides=("drivesync")
install=.INSTALL
source=("https://github.com/MStadlmeier/$_origname/archive/$pkgver.tar.gz")
md5sums=("821d5a4da22cd473290727a7ea470f0b")
sha256sums=("fb32c3d89171ac4680e02d9325e042728baad40b74bcaff8c77742b0958d8388")

prepare() {
    gem install bundler
	tar xf "$pkgver.tar.gz"
}

build() {
	cd "$_origname-$pkgver"
	~/.gem/ruby/$(ls ~/.gem/ruby | tail -n 1)/bin/bundle install
}

package() {
    if [ ! -d /opt/drivesync ]; then
        echo "alias drivesync='ruby /opt/drivesync/drivesync.rb'" >> ~/.bashrc
    fi

    mv -T $_origname-$pkgver /tmp/drivesync
}
