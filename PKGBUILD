# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: Jose Riha <jose 1711 gmail com>
# Contributor: Jeremy MJ <jskier@gmail.com>
# Contributor: Niklas Hedlund <nojan1989@gmail.com>

pkgname=motioneye-git
pkgver=0.42.1.r318.g6a5953b
pkgrel=2
pkgdesc="A web frontend for the motion daemon, Python 3 development branch"
url="https://github.com/motioneye-project/motioneye"
license=("GPL3")
arch=("any")
provides=("motioneye")
conflicts=("motioneye")
depends=("motion"
         "python-jinja"
         "python-pillow"
         "python-pycurl"
         "python-tornado"
         "python-six"
         "python-babel"
         "python-boto3")
makedepends=("python-setuptools" "python-pip")
backup=("etc/motioneye/motioneye.conf")
source=("git+$url#branch=dev"
        "motioneye.service")
sha256sums=('SKIP'
            '9de27c851809664a8aa4ca8ee48cae1db2954ccb09978a85c127745bf7445286')
backup=("etc/motioneye/motioneye.conf")
install=motioneye.install

pkgver(){
 cd "motioneye"
 git describe --long --tags | sed "s/\([^-]*-g\)/r\1/;s/-/./g;s/^v//"
}

package(){
 cd motioneye
 PIP_CONFIG_FILE=/dev/null pip install --isolated --root="${pkgdir}" --ignore-installed --no-deps .
 # configuration folder must be writable by motioneye
 install -Dm 660 "motioneye/extra/motioneye.conf.sample" "$pkgdir/etc/motioneye/motioneye.conf"
 install -Dm 644 "$srcdir/motioneye.service" "$pkgdir/usr/lib/systemd/system/motioneye.service"
}
