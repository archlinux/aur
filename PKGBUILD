# Maintainer: Frédéric Bogaerts <fred@netpack.pt>

pkgname=xfb
pkgver=1.23
pkgrel=9
pkgdesc="Open-source Radio Automation"
arch=('x86_64')
url="https://github.com/netpack/XFB"
license=('GPL3')

depends=('base-devel' 'patch' 'qt5-base' 'qt5-tools' 'qt5-webkit' 'qt5-multimedia' 'perl-image-exiftool' 'ffmpeg' 'lame' 'sox' 'mediainfo' )
optdepends=('audacity' 'mplayer' 'soundconverter' 'yt-dlp') #Thank you MisterEsse

makedepends=('qt5-tools')


source=("https://github.com/netpack/XFB/releases/download/v1.23/xfb-1.23.tar.gz")

sha512sums=("7e8610151860e66c9d5599f0a458d5832aabeab203c4ac286c67c4c3cc7916a9d1bb5069edaff3c892064983d5a97c3eb11de3a48e451b727b0307aef22a64d8")


build() {
  cd "$srcdir/usr/share/xfb/bin"
  qmake-qt5 PREFIX=/usr ../src/XFB.pro
  make
}

package() {
  # Create necessary directories
  install -d "$pkgdir/usr/bin"
  install -d "$pkgdir/etc/xfb"
  install -d "$pkgdir/usr/share/xfb"
  install -d "$pkgdir/usr/share/xfb/bin"
  install -d "$pkgdir/usr/share/xfb/config"
  install -d "$pkgdir/usr/share/xfb/scripts"
  install -d "$pkgdir/usr/share/xfb/jingles"
  install -d "$pkgdir/usr/share/xfb/music"
  install -d "$pkgdir/usr/share/xfb/playlists"
  install -d "$pkgdir/usr/share/xfb/recordings"
  install -d "$pkgdir/usr/share/xfb/tmp"
  install -d "$pkgdir/usr/share/xfb/ftp"
  install -d "$pkgdir/usr/share/applications"
  install -d "$pkgdir/usr/share/pixmaps"

  # Install additional files
  install -m644 usr/share/xfb/config/* "$pkgdir/usr/share/xfb/config"
  install -m644 usr/share/xfb/scripts/* "$pkgdir/usr/share/xfb/scripts"
  install -m755 usr/share/xfb/bin/* "$pkgdir/usr/share/xfb/bin"
  install -m644 etc/xfb/* "$pkgdir/etc/xfb"

  cp -r usr/share/xfb/ftp usr/share/xfb/jingles usr/share/xfb/music usr/share/xfb/playlists "$pkgdir/usr/share/xfb/"

    # Install .desktop file
  install -m644 usr/share/xfb/XFB.desktop "$pkgdir/usr/share/applications/"

  # Install icon file
  install -m644 usr/share/xfb/xfb_icon.png "$pkgdir/usr/share/pixmaps/"

  # Set the correct permissions on the database
  chmod +x "$pkgdir/usr/share/xfb/config/adb.db"

  # Create symbolic link in /usr/bin
  ln -s "/usr/share/xfb/bin/XFB" "$pkgdir/usr/bin/XFB"

  # Change ownerships
  #chown "$USER:$USER" "$pkgdir/etc/xfb/xfb.conf"
  #chown "$USER:$USER" "$pkgdir/usr/share/applications/XFB.desktop"
  #chown "$USER:$USER" "$pkgdir/usr/share/pixmaps/xfb_icon.png"
  chown -R "$USER:$USER" "$pkgdir/usr/share/xfb"

  echo "Installation of XFB completed successfully!"
  echo "The configuration file is: /etc/xfb/xfb.conf"
  echo "The shared folders are under: /usr/share/xfb"
  echo "You may want to install yt-dlp"
  echo "Can you share some ETH? 0x9700225FcD115230C9166BD68CEdc23e329D3CdF"
  echo "Thank you for installing XFB! I hope you enjoy it! Made with love & linux!"
}



