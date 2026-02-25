# Maintainer: Benigno Batista Jr <benignobjunior@gmail.com>
pkgname=vaapi-autoconfig
pkgver=1.0.0
pkgrel=1
pkgdesc='Auto-detect GPU and configure VA-API hardware video acceleration'
arch=('any')
url='https://wiki.archlinux.org/title/Hardware_video_acceleration'
license=('MIT')
depends=('bash' 'libva' 'dbus')
optdepends=(
    'intel-media-driver: VA-API for Intel GPUs (Broadwell+)'
    'libva-intel-driver: VA-API for older Intel GPUs (up to Coffee Lake)'
    'libva-mesa-driver: VA-API for AMD GPUs'
    'libva-nvidia-driver: VA-API for NVIDIA GPUs'
    'libva-utils: vainfo verification tool'
)
source=('detect-vaapi' 'vaapi-activate' 'vaapi-verify' 'LICENSE')
sha256sums=('48820a21db67e4a1f72215581a1deb899ff9bb46346281898b8a072aef3ca13f'
            'b98a29ab0130efef7841757363c7c98e4d231ad25ae9f2a5709bf8dc11cd779d'
            '2bca2c3ffd3c975e722744973fcb46d206b74250c5dd9f0e1c045a2357362f38'
            '2eb5cf5f51415ad4d11336f0771301ea309344d8b11b82a49d009290f71d3041')
install=vaapi-autoconfig.install

package() {
    install -Dm755 "$srcdir/detect-vaapi" "$pkgdir/usr/lib/vaapi-autoconfig/detect-vaapi"
    install -Dm755 "$srcdir/vaapi-activate" "$pkgdir/usr/bin/vaapi-activate"
    install -Dm755 "$srcdir/vaapi-verify" "$pkgdir/usr/bin/vaapi-verify"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -dm755 "$pkgdir/usr/lib/systemd/user-environment-generators"
    ln -s /usr/lib/vaapi-autoconfig/detect-vaapi \
        "$pkgdir/usr/lib/systemd/user-environment-generators/50-vaapi-autoconfig"
}
