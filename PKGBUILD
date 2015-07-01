# Contributor: Denys Popov <besisland@besisland.name>

pkgname=wolfenstein3d
pkgver=1.4
pkgrel=1
pkgdesc="Wolfenstein 3D, cult first person shooter video game from id Software and Apogee"
arch=(any)
url="http://www.idsoftware.com/games/wolfenstein/wolf3d/"
license=('custom')
depends=('dosbox')
makedepends=('unzip')
source=(\
    'LICENSE'
    'ftp://ftp.3drealms.com/share/1wolf14.zip' \
    'setup.cfg' \
    'dosbox-install.conf' \
    'dosbox.conf' \
    'runme' \
    'wolfenstein3d.desktop' \
    'http://www.gamesprays.com/images/icons/wolfenstein-3d-mechahitler-animated-spray-1806_preview.png' \
)
sha256sums=(\
    'daf535328cb428bba937ffde5db99db18f2b9eac338cb213f8ea1dda7e2f8d9e' \
    'cb2a2ef7ecef14152c65ff93cc3b84fbd3e8eb0c5c1de41a6fc8cdef559451a8' \
    '6aaa1aa340338149ac104f66db998ccb7cebdf14db4fc24d2d51a8fa192e10b0' \
    'bd10ed1e5d0017e10dbd949cd3d6180f6210c6b795962e355a46c8eb46dc9558' \
    '5a3c5e5a5d65614d90b92174f4318cee5631ec9fbaeda480d8740b79f145a422' \
    'eaa4ff9fb046685a38e368dbd70424d3ec3660f85e02cbbe4099b909f9a7a804' \
    'ecc61d3754c7a1c2d7547f029f5b456e3efafcbb73b30d843287905b48ead1d6' \
    '23d898edb45cbd0c64a155592e84f27495848ab147faafa65bf4dffb1223d4ce' \
)

build() {
    cd "${srcdir}"

    mkdir install
    mkdir install/wolf3d
    unzip 1wolf14.zip -d install
    cp setup.cfg install/
    dosbox -conf dosbox-install.conf

    install -d ${pkgdir}/opt/wolfenstein3d
    install -m 0644 install/wolf3d/* ${pkgdir}/opt/wolfenstein3d/
    install -m 0644 dosbox.conf ${pkgdir}/opt/wolfenstein3d/dosbox.conf
    install -m 0755 runme ${pkgdir}/opt/wolfenstein3d/runme

    install -D -m 0644 wolfenstein3d.desktop ${pkgdir}/usr/share/applications/wolfenstein3d.desktop
    install -D -m 0644 wolfenstein-3d-mechahitler-animated-spray-1806_preview.png ${pkgdir}/usr/share/pixmaps/wolfenstein3d.png

    install -D -m 0644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
