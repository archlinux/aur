# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Mario Finelli <mario dot finelli at yahoo dot com>
# Contributor: Alexander De Sousa <archaur.xandy21 at spamgourmet dot com>

pkgname=awoken-icons
pkgver=2.5.2
pkgrel=4
pkgdesc="Simple and quite complete icon set, Token-style."
url="http://deviantart.com/view/163570862"
arch=('any')
license=('CCPL:by-sa')
depends=('librsvg')
optdepends=("imagemagick: To color the iconset."
            "zenity: To have a GUI for the configuration script."
            "xdg-utils: To be able to launch programs from the configuration script.")
source=(awoken-icons.install
        "https://www.dropbox.com/s/p3hfu7jw3vv7os9/AwOken-2.5.zip?dl=0")
options=('!strip')
sha256sums=('846c254776cb4763afc9db13387ff306f77be3537730d76a26f005ab3f77b611'
            'd122ee0457079aaa30a664ae582fbc6208414e8728f497dce399ed9f33f9b36e')
install=awoken-icons.install

package() {
  install -dm755 "$pkgdir"/usr/{bin,share/icons}

  msg2 "Copying files..."
  for _theme in AwOken-2.5/AwOken{,Dark,White}.tar.gz; do
    tar --no-same-owner -xzf $_theme -C "$pkgdir/usr/share/icons/"
  done

  msg2 "Adjusting permissions..."
  find "$pkgdir/" -type d -exec chmod 755 '{}' \;
  find "$pkgdir/" -type f -exec chmod 644 '{}' \;
  find "$pkgdir/" -name awoken-icon-theme-customization\* -exec chmod 755 '{}' \;

  # Symlink customization scripts in the user binaries directory:
  ln -sf /usr/share/icons/AwOken/awoken-icon-theme-customization* "$pkgdir/usr/bin/"
  ln -sf /usr/share/icons/AwOkenDark/awoken-icon-theme-customization-dark "$pkgdir/usr/bin/"
  ln -sf /usr/share/icons/AwOkenWhite/awoken-icon-theme-customization-white "$pkgdir/usr/bin/"
}
