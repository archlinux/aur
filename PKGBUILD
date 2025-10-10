# Maintainer: Berke Oruç <berke3oruc@gmail.com>
pkgname=berkemc
pkgver=4.0.0
pkgrel=1
pkgdesc="Advanced Minecraft launcher with mod support, skin management, and performance monitoring"
arch=('any')
url="https://github.com/BerkeOruc/BerkeMinecraftLuncher"
license=('MIT')
depends=('python>=3.8' 'java-runtime>=17' 'python-requests' 'python-rich' 'python-colorama' 'python-psutil')
makedepends=('python-setuptools')
source=("berkemc-$pkgver.tar.gz::https://github.com/BerkeOruc/BerkeMinecraftLuncher/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
    cd "$srcdir/BerkeMinecraftLuncher-$pkgver"
    
    # Install Python package
    python setup.py install --root="$pkgdir" --optimize=1
    
    # Install launcher script
    install -Dm755 berke_minecraft_launcher.py "$pkgdir/usr/bin/berke-minecraft-launcher"
    install -Dm755 berkemc "$pkgdir/usr/bin/berkemc"
    
    # Install desktop file
    install -Dm644 berke-minecraft-launcher.desktop "$pkgdir/usr/share/applications/berke-minecraft-launcher.desktop"
    
    # Install icon
    install -Dm644 bmc_logo.png "$pkgdir/usr/share/pixmaps/berkemc.png"
    
    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    
    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 ARCH_HYPRLAND_KURULUM.md "$pkgdir/usr/share/doc/$pkgname/ARCH_HYPRLAND_KURULUM.md"
    install -Dm644 INSTALLATION_GUIDE.md "$pkgdir/usr/share/doc/$pkgname/INSTALLATION_GUIDE.md"
    
    # Post-install message
    install -Dm644 berkemc-post-install.sh "$pkgdir/usr/share/doc/$pkgname/post-install.sh"
}
