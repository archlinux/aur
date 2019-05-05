# Maintainer: Daniel Popov (dan93bars@gmail.com)

pkgname=drivesync
pkgver=1.4.0
pkgrel=2
pkgdesc='Google Drive synchronization for Linux'
arch=('any')
url='https://github.com/MStadlmeier/drivesync'
license=('MIT')
depends=('ruby>=2.5')
provides=("drivesync")
source=("https://github.com/MStadlmeier/$pkgname/archive/$pkgver.tar.gz"
        'drivesync')
sha512sums=('9f08348ffeaf783832b817cda3616d9206492474767a2ffc772d6d7405af926c64f2e20c7e332d39d35156afa09d6388371469ba8c62b57642a92775a5de9a16'
            'e5191b8fb8fe4659a8c1fd95def971045c00ba56cb069b83af3eb82e62baf2cb31a74b4424f6e924813eed2385014924af1149890c25ed36bb05488ff33befb0')

build() {
    cd "$pkgname-$pkgver"
    # install bundler 1.17.1, upper versions does not work with this package
    gem install bundler -v 1.17.1
    PATH="$(gem environment gempath):$PATH"
    bundle install --no-cache --deployment
}

package() {
    install -D -m755 'drivesync' "$pkgdir/usr/bin/drivesync"
    install -d -m755 "$pkgdir/usr/share/drivesync"
    
    cd "$pkgname-$pkgver"
    cp -r * "$pkgdir/usr/share/drivesync/"
}
