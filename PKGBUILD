# Maintainer: Mohamed Tarek <Mokhamed_tarek@mail.ru>
# PKGBUILD for tuf-fan-boost-notification-git

pkgname=tuf-fan-boost-notification-git
pkgver=1.0
pkgrel=1
pkgdesc="Fan Boost Mode Notification Script for ASUS TUF laptops"
arch=('any')
url="https://github.com/MioKira/tuf-fan-boost-notification"
license=('MIT')
depends=('inotify-tools' 'libnotify')

source=("$pkgname::git+https://github.com/MioKira/tuf-fan-boost-notification.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git rev-list --count HEAD
}

package() {
  mkdir -p "$pkgdir/usr/bin/FanNotifications"
  install -Dm755 "$srcdir/$pkgname/FanNotifications.sh" "$pkgdir/usr/bin/FanNotifications/fan-boost-notification/FanNotifications.sh"

  image_path="$srcdir/$pkgname/fan"  


  # Copy image without sudo
  install -Dm644 "$image_path" "$pkgdir/usr/bin/FanNotifications/fan-boost-notification/fan"

  # Create and enable systemd service (potentially requires adjustment for your DE)
  echo "
  ######################################################################################################
#                                                                                               	  #
#  To auto-run the script in Hyprland, add:                                                       	#
#                                                                                               	  #
#  ' exec-once = /usr/bin/tuf-fan-boost-notification-git/FanNotifications.sh'                       #
#                                                                                               	  #
#  If you're using another DE, check:                                                            	  #
#  https://github.com/MioKira/tuf-fan-boost-notification#autostart-with-system                   	  #
#                                                                                               	  #
#  To start the script, run:                                                                     	  #
#  /usr/bin/tuf-fan-boost-notification-git/FanNotifications.sh                                      #
#                                                                                               	  #
######################################################################################################
"

}
