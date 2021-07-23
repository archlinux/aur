# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Kyle Sferrazza <kyle.sferrazza@gmail.com>
# Contriubutor: robertfoster

pkgname=wifiphisher-git
pkgver=r787.f0be783
pkgrel=3
pkgdesc='Fast automated phishing attacks against WPA networks'
arch=('any')
url='https://github.com/sophron/wifiphisher'
license=('MIT')
depends=('python'
         'python-httplib2'
         'python-scapy'
         'aircrack-ng'
         'python-pyopenssl'
         'python-pyric'
         'python-blessings'
         'python-pbkdf2'
         'python-tornado'
         'hostapd'
         'dnsmasq'
         'python-dbus'
         'python-roguehostapd-git')
makedepends=('git' 'python-setuptools')
provides=('wifiphisher')
conflicts=('wifiphisher')
source=('git+https://github.com/sophron/wifiphisher.git')
sha512sums=('SKIP')

pkgver() {
    cd wifiphisher
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd wifiphisher
    python setup.py build
}

package() {
    cd wifiphisher
    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
    install -Dm 644 -t "$pkgdir/usr/share/doc/wifiphisher/" *.md
    install -Dm 644 LICENSE.txt "$pkgdir/usr/share/licenses/wifiphisher/LICENSE"
}
