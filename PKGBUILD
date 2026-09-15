# Maintainer: Daniele Bartolini <dbartolini crownengine org>

pkgname=crown-nightly-bin
pkgver=0.65.0.r9817.g1d7e1da13
pkgrel=1
pkgdesc="A complete and cross-platform game engine designed for flexibility, performance, and fast-iterations."
arch=(x86_64)
url="https://www.crownengine.org"
license=('MIT' 'GPL3')
depends=('glib2>=2.64.6'
         'gtk3>=3.24'
         'libgl'
         'libpulse'
         'libx11'
         'libxrandr'
         )
_upstream_version=0.65.0
_commit=1d7e1da13
_gdrive_id=1BkR3ekgsX6EaHV5NYb4kax0js-IN1v7e
source=("crown-${_upstream_version}-master-${_commit}-linux-x64.tar.gz::https://drive.usercontent.google.com/download?id=${_gdrive_id}&export=download&confirm=t"
        "crown.sh"
        )
sha256sums=('8f6da0d88648f92c8bde7cf2fbf409e6b09f80656f7d806d8f44b4da917ba45b'
            '514892dfc9ccfb0d83c847d459642186f532a527af9f46bdb1402218820f7062')
options=('!strip')

package() {
    install -d "$pkgdir"/opt
    cp -r crown-${_upstream_version}-master-${_commit}-linux-x64 "$pkgdir/opt/crown-nightly"

    # Launcher.
    install -D -m755 crown.sh "${pkgdir}/usr/bin/crown-nightly"

    # License.
    install -D -m644 crown-${_upstream_version}-master-${_commit}-linux-x64/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # .desktop and icons.
    install -D -m644 crown-${_upstream_version}-master-${_commit}-linux-x64/org.crownengine.Crown.desktop "${pkgdir}/usr/share/applications/org.crownengine.CrownNightly.desktop"
    sed -i -e 's/^Name=Crown$/Name=Crown Nightly/' \
           -e 's/^Exec=crown$/Exec=crown-nightly/' \
           -e 's/^TryExec=crown$/TryExec=crown-nightly/' \
           -e 's/^Icon=org\.crownengine\.Crown$/Icon=org.crownengine.CrownNightly/' \
        "${pkgdir}/usr/share/applications/org.crownengine.CrownNightly.desktop"
    install -D -m644 crown-${_upstream_version}-master-${_commit}-linux-x64/org.crownengine.Crown.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/org.crownengine.CrownNightly.svg"
}
