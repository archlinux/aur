# Maintainer: Philipp Schmitt <philipp@schmitt.co>
_pkgname="nzbmegasearch"
pkgname="nzbmegasearch-git"
pkgver=v0.46.r3.g24b5e5b
pkgrel=1
pkgdesc="Aggregate automatically NZB search results. Easy. Quick. Clean."
arch=(any)
url="http://pillone.github.io/usntssearch"
license=('unknown')
depends=('python2' 'python2-pyopenssl')
install='nzbmegasearch.install'
source=("nzbmegasearch::git+https://github.com/pillone/usntssearch.git#branch=master"
        "nzbmegasearch.service"
        "nzbmegasearch.sh"
        "nzbmegasearch.install")
md5sums=('SKIP'
         'a2696d8993a85ec406f08f1eb6c0705e'
         'dfb6224058ffefcb9f9043528fef1c8d'
         'de4e5aeba564472f7024326c0b2b9c0e')
sha1sums=('SKIP'
          '6637d42ae71b46d7c7d57afc99eac60d1482467b'
          '08ee33416b1839427586a9bcb36f39b9c8779ffd'
          '01f47661fee6f29ea6db2159d523fd7c2cc3289d')
sha256sums=('SKIP'
            'fdadc1bf5256f0660b6a1bf380c006d47d68b2770375989f13bff5d4b3bd08e4'
            'f865904bbeda3a4f049533f5920d05b5d27fb595013e6c3b7ce2c0b671f94924'
            '44f7a52a8c4d706aebb49d99f103526b54acc3320d5206811badd73745281dfa')
sha512sums=('SKIP'
            'f8a49ce9d6e3948b3987aa890d555b0731c700bca3d8b64117d0c7eae4d96a19dcd4e637bec3788662c67f83886861b96b0d858d72e3847cf6d0ad5376611734'
            'e04f9cbac611b4daf8f7f96dffda354d8903c2500539d00ffb646f0da9fbb1ffdda6e8a8bf6846c69850e01fe7d31abffe1d5441b0699ec87cd777928a69ad7e'
            'da285d15076fff83640c3d11587fa6f0f4abb3267ad1c8a083fdad2d98f0b9527843e6eb3c143f6a355ac7a39dd91c665138af4f57e6eb1d2f2b45b96113d773')

pkgver() {
    cd "$_pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$srcdir"

    msg2 "Install NZBmegasearch to /opt/nzbmegasearch"
    install -d -m 755 "${pkgdir}/opt/nzbmegasearch"
    cp -dpr --no-preserve=ownership "${srcdir}/nzbmegasearch/NZBmegasearch/"* "${pkgdir}/opt/nzbmegasearch"

    msg2 "Install executable into /usr/bin"
    install -D -m 755 "${srcdir}/nzbmegasearch.sh" "${pkgdir}/usr/bin/nzbmegasearch"

    msg2 "Install nzbmegasearch.service"
    install -D -m 644 "${srcdir}/nzbmegasearch.service" "${pkgdir}/usr/lib/systemd/system/nzbmegasearch.service"
}

