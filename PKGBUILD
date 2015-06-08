# Maintainer: Daniel Egeberg <daniel.egeberg@gmail.com>
# Contributor: Justin Dray <justin@dray.be>
pkgname="sonarr"
pkgver="2.0.0.3212"
pkgrel=1
pkgdesc="PVR for newsgroup users. Formerly known as NZBDrone"
arch=(any)
url="http://www.sonarr.tv"
license=('GPL3')
depends=('mono' 'libmediainfo' 'sqlite')
optdepends=('sabnzbd: an NZB downloader'
            'nzbget: an NZB downloader'
            'transmission: a torrent downloader'
            'deluge: a torrent downloader')
install='sonarr.install'
provides=('nzbdrone' 'nzbdrone-torrents')
conflicts=('nzbdrone' 'nzbdrone-torrents')
replaces=('nzbdrone' 'nzbdrone-torrents')
source=("http://update.sonarr.tv/v2/master/mono/NzbDrone.master.${pkgver}.mono.tar.gz"
        "sonarr.sh"
        "sonarr.service"
        "sonarr.install")
noextract=()
md5sums=('57765205b3008f6dfd429ff8945cdf5f'
         'a7490c3f8d6c3a314b59f87f71086f1f'
         '41d8663e989a8db1fc4c6b81187a4d48'
         '2edc6fbef4cb9f627196fddb15aea033')
sha1sums=('521cbead7931e45690e0e23e33dcfa2c3aa391b5'
          '839c58c88ea515441a3c976c658d7bf519cce705'
          '58ade6c12a4210619f18fe611254ac6e6e830d59'
          '2aa3375a3a11deb4abed7fd3243633a1a01435ab')
sha256sums=('0ba572d90cc96295995d497795e34f14103ef5cffab926d589d54f5e7e038c2d'
            'c5a2335351a8b23ef3e5d4e01652ba3699eb86ea0d607f29b25dda0d2c0f2cb7'
            '04be8b2fab802027344e71882fce7b7ebcfc670004cce38ea2ee9a700ec969b3'
            '7a46a7d43bc6425fead41fe6db95ade6424090d5610a82f3e1b1d6d9a01582da')
sha512sums=('3a2c284e52de42ba4f31065893f83e77ec9de9ae1697fc4a1e5b5092f6dcc08c0b6e75ed4c2fa9938f864f8828b751908a2fd3251092fbfa7b45caf2c350e753'
            '84efa2eebd9afe6b74203aefdc3fdbd4088ecfad17dbe929396f1ffc639743b615a9b75566a0b45d6b7925bd5675368015047c6d65c1421ffe8712728f350695'
            '438de225c38c26aaa15cae243b18d0be85f3f0e54f1297bf182082a0bdbd936d21928cdcdb899f0f18c6ec32ee88c2e0f0d29b8a2a1cdf98a8e1907cd6f36a2c'
            'f7ea7e590bb3d0dcbebefe64b8ce205ee8bbd84f4941d7b01a1cb6e5ca4196a27b17fcf7799b3c9dd81fdee55b57e6e803a1e75afa00808512571c2b5812de38')

package() {
    cd "$srcdir"

    install -d -m 755 "${pkgdir}/var/lib/sonarr"

    msg2 "Install Sonarr in /usr/lib"
    install -d -m 755 "${pkgdir}/usr/lib/sonarr"
    cp -dpr --no-preserve=ownership "${srcdir}/NzbDrone/"* "${pkgdir}/usr/lib/sonarr"

    msg2 "Install executable into /usr/bin"
    install -D -m755 "${srcdir}/sonarr.sh" "${pkgdir}/usr/bin/sonarr"

    msg2 "Install sonarr.service"
    install -D -m 644 "${srcdir}/sonarr.service" "${pkgdir}/usr/lib/systemd/system/sonarr.service"
}
