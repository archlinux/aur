# Maintainer: Slash <demodevil5 [at] yahoo [dot] com>

pkgname=maraschinoproject-git
pkgver=v0.3.0.r230.gf16c775
pkgrel=1
pkgdesc="Web-based frontend for XBMC, Sickbeard, Sabnzbd, and more."
arch=('any')
url="http://www.maraschinoproject.com/"
license=('GPL')
depends=('python2')
makedepends=('git')
backup=('etc/conf.d/maraschino')
install='maraschino.install'
source=('maraschino.sh' 'maraschino.confd' 'maraschino.service'
'maraschino::git+https://github.com/mrkipling/maraschino.git')
sha256sums=('b711e56f3275aa2e600a737471e2f3d8adc0eb7452e7fbf0937cb4584f939e48'
            '2f9073c6cddd6a73a1f156c9280da757c8ea64c0134da70696705794a8d38aa5'
            '51d8698cac6b8a4d70e71aaa6bda1dbc071a3beb77557b3c5abfb33a78e63b6b'
            'SKIP')

pkgver() {
    cd "${srcdir}/maraschino"
    git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
    # Make destination directories
    install -d "${pkgdir}/usr/lib"
    install -d "${pkgdir}/var/lib/maraschino"
    install -dm777 "${pkgdir}/run/maraschino"

    # Move Maraschino files to destination directory
    cp -r "${srcdir}/maraschino" "${pkgdir}/usr/lib/maraschino"

    # Install Launcher Script
    install -D -m755 "${srcdir}/maraschino.sh" \
        "${pkgdir}/usr/bin/maraschino"

    # Install systemd Script
    install -D -m755 "${srcdir}/maraschino.service" \
        "${pkgdir}/usr/lib/systemd/system/maraschino.service"

    # Install Daemon Configuration
    install -D -m644 "${srcdir}/maraschino.confd" \
        "${pkgdir}/etc/conf.d/maraschino"
}

