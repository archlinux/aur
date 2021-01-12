# Maintainer: CodeLathe <itservices@codelathe.com>
# Contributor: CodeLathe <itservices@codelathe.com>

pkgname=filecloudsync
pkgver=20.3.0.5156
pkgrel=3
pkgdesc="FileCloud Sync for Linux: targeted for Ubuntu (12.04 and higher). Uses GTK2."
arch=('x86_64')
url="https://www.getfilecloud.com/additional-downloads"
license=('proprietary')
depends=('libdbusmenu-gtk2' 'libpng12' 'openssl-1.0' 'wxgtk2')

#https://bugs.archlinux.org/task/65042
source_x86_64=("filecloudsync_${pkgver}_linux_amd64.zip::http://patch.codelathe.com/tonido/live/installer/x86-linux/filecloudsync_linux_amd64.zip" 'FileCloud.desktop' 'LICENSE')

sha256sums_x86_64=('be5d442970064413122fbfe3ef01169da22fabfbd35d0114ccaae1d9b2963a43'
                   '90db80ec4ca61283e5ed09a300df55a3aa87be7b7fbf53a6ee0be8d71cfa8d75'
                   'a397573d54734349929b3572875577073c3aeab6d9e4d6dbae4400a6954a61ed')
install=${pkgname}.install

package() {
  cd "$srcdir/"
  install -dm751 "$pkgdir/opt/filecloudsync"
  install -Dm644 -t "$pkgdir/opt/filecloudsync" lib*
  install -Dm644 -t "$pkgdir/opt/filecloudsync" *.{png,pem}
  install -Dm644 -t "$pkgdir/opt/filecloudsync" translationsdc.zip
  install -Dm755 -t "$pkgdir/opt/filecloudsync" filecloudsync
  install -Dm644 -t "$pkgdir/opt/filecloudsync" filecloudsynccon
  install -Dm755 -t "$pkgdir/opt/filecloudsync" filecloudsyncstart.sh
  install -Dm644 -t "$pkgdir/usr/share/applications/" FileCloud.desktop
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -d "$pkgdir/usr/bin"
  sed -i 's|\./filecloudsync 2> /dev/null 1>&2|/opt/filecloudsync/filecloudsync|' "$pkgdir/opt/filecloudsync/filecloudsyncstart.sh"
  sed -i 's|export LD_LIBRARY_PATH=\.|export LD_LIBRARY_PATH=/opt/filecloudsync/|' "$pkgdir/opt/filecloudsync/filecloudsyncstart.sh"
  ln -s "/opt/filecloudsync/filecloudsyncstart.sh" "$pkgdir/usr/bin/filecloudsyncstart.sh"
  ln -s "/opt/filecloudsync/filecloudsync" "$pkgdir/usr/bin/filecloudsync"
}

