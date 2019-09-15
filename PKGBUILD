# Maintainer: Nahuel Morata <nahuelmorata@gmail.com>
pkgname=drivesync-git
_origname="drivesync"
pkgver=1.4.0.r0.g1124fc6
pkgrel=1
pkgdesc="A command line utility that synchronizes your Google Drive files with a local folder on your machine"
arch=('any')
url="https://github.com/MStadlmeier/drivesync"
license=('MIT')
depends=("ruby")
provides=("drivesync")
install=.INSTALL
source=("$pkgname::git+https://github.com/MStadlmeier/drivesync.git")
md5sums=("SKIP")

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    gem install bundler
}

build() {
	cd "$pkgname"
	~/.gem/ruby/$(ls ~/.gem/ruby | tail -n 1)/bin/bundle install
}

package() {
    if [ ! -d /opt/drivesync ]; then
        echo "alias drivesync='ruby /opt/drivesync/drivesync.rb'" >> ~/.bashrc
    fi

    mv -T $pkgname /tmp/drivesync
}
