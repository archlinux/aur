# Maintainer: Aditya Mishra <pegvinaditya@proton.me>
pkgname=rock.so
pkgver=1.2.1
pkgrel=1
pkgdesc="All In One Messaging - Manage Tasks, Files & Notes"
arch=('x86_64')
url="https://rock.so/"
license=('Unlicensed') # Extract The AppImage & Check the package.json file in resources/app/
provides=('rock.so')
conflicts=('rock.so')
depends=('fuse2')
options=(!strip) # necessary otherwise the AppImage file in the package is truncated
source=(
  https://desktop.rock.so/Rock-${pkgver}.AppImage
  rock_custom.desktop
  getSha512.sh
)
sha512sums=(
  3f2d7893d8659174956fcd3d06960e6256e0ef394a800c32db0f71c84a778d12ed2b6da263e65a2b53374d5347415e42d094924958048ca6427248b4ffd142a3
  SKIP
  SKIP
)

_filename="Rock-${pkgver}.AppImage"

package() {
  chmod +x ${_filename}
  ./${_filename} --appimage-extract

  install -Dm644 "./squashfs-root/rock.png" "$pkgdir/usr/share/icons/rock_so.png"
  install -Dm644 "./rock_custom.desktop" "$pkgdir/usr/share/applications/rock_so.desktop"
  install -Dm755 ${_filename} "$pkgdir/usr/bin/rock_so"

  rm -rf ./squashfs-root
}
