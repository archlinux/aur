# Maintainer: Matheus Vilano <aur.negotiate177@passinbox.com>

pkgname=unreal-engine-manager
pkgver=0.0.1
pkgrel=1
pkgdesc="A Python-based Linux application for managing Unreal Engine installations."
arch=('any')
url='https://github.com/matheusvilano/unreal-engine-manager/'
license=('Apache-2.0')
conflicts=('unreal-engine' 'unreal-engine-4' 'unreal-engine-git' 'unreal-engine-bin')
depends=('python' 'tk')
optdepends=('android-ndk: Android build support'
            'jetbrains-toolbox: For CLion/Rider/PyCharm'
            'code: VS Code support')
_tag='e4cb1bfecc360d2aa56696a529f8bb7400bbe311'
source=("git+https://github.com/matheusvilano/unreal-engine-manager.git#tag=${_tag}")
sha256sums=('SKIP')  # git source; using tag (from `git rev-parse`) for integrity instead.
install='package.install'

package() 
{
    # Install application code
    cp -r "${srcdir}/unreal-engine-manager" "$pkgdir"/opt/unreal-engine-manager
    
    # Create symlink for better compatibility
    ln -sf /opt/unreal-engine-manager/source/main.py "$pkgdir"/usr/bin/unreal-engine-manager
    
    # Install icons
    for resolution in 16 24 32 48 64 256; do
        install -Dm644 "${srcdir}/unreal-engine-manager/resources/ue${resolution}.png" \
            "$pkgdir"/usr/share/icons/hicolor/${resolution}x${resolution}/apps/unreal-engine.png
    done
    
    # Install Desktop File
    install -Dm644 "${srcdir}/unreal-engine-manager/resources/app.desktop" \
        "$pkgdir"/usr/share/applications/unreal-engine-manager.desktop
    
    # Install MIME Types
    install -Dm644 "${srcdir}/unreal-engine-manager/resources/mime.xml" \
        "$pkgdir"/usr/share/mime/packages/unreal-engine.xml
}