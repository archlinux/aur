# Maintainer: A. Richard <dubitae@gmail.com>
pkgname=gmusicproxy-stable
pkgver=1.0.4
pkgrel=1
pkgdesc="Let's stream Google Play Music using any media-player"
arch=('any')
url="https://github.com/diraimondo/gmusicproxy"
license=('GPL3')
groups=()
depends=(
    'python2'
    'python2-netifaces'
    'python2-xdg'
    'python2-eyed3'
    'python2-daemon'
    'python2-gmusicapi'
)
makedepends=('python2-setuptools')
optdepends=()
provides=()
conflicts=(gmusicproxy)
replaces=()
backup=()
options=(!emptydirs)
install=
changelog=
source=(
    'https://github.com/diraimondo/gmusicproxy/archive/v1.0.4.tar.gz'
    'gmusicproxy.cfg.sample'
    'gmusicproxy.user.service'
    'gmusicproxy.system.service'
)
noextract=()
md5sums=(
    '28408c8877e04c42e7680ca0eb2182b5'
    'e03e8f0937997fd8e86f60c3c28d1d26'
    'f4abb012aabe7eec77f3b7b83a61d404'
    '3edc1b7f6e5e47704f35e4cb6237a8be'
)

package() {
    cd "$srcdir/gmusicproxy-$pkgver"
    python2 setup.py install --root="$pkgdir" --optimize=1

    install -Dm644 "${srcdir}"/gmusicproxy.cfg.sample \
                   "${pkgdir}"/etc/gmusicproxy.cfg.sample

    install -Dm644 "${srcdir}"/gmusicproxy.system.service \
                   "${pkgdir}"/usr/lib/systemd/system/gmusicproxy.service

    install -Dm644 "${srcdir}"/gmusicproxy.user.service \
                   "${pkgdir}"/usr/lib/systemd/user/gmusicproxy.service
}
