# Maintainer: Mohamed Tarek <Mokhamed_tarek@mail.ru>
# PKGBUILD for tuf-fan-boost-notification-git

pkgname=tuf-fan-boost-notification-git
pkgver=1.0.0
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
  mkdir -p "$pkgdir/usr/bin"
  install -Dm755 "$srcdir/$pkgname/FanNotifications.sh" "$pkgdir/usr/bin/fan-boost-notification"
  
  # Ask for root permission to copy to /usr/bin
  sudo cp -r "$srcdir/$pkgname" "/usr/bin/"
  sudo chmod +x /usr/bin/fan-boost-notification-git/FanNotifications.sh
	
   # Create and enable systemd service
  echo "
  ######################################################################################################
#                                                                                               	  #
#  To auto-run the script in Hyprland, add:                                                       	  #
#                                                                                               	  #
#  ' exec-once = /usr/bin/fan-boost-notification-git/FanNotifications.sh '                       	  #
#                                                                                               	  #
#  If you're using another DE, check:                                                            	  #
#  https://github.com/MioKira/tuf-fan-boost-notification#autostart-with-system                   	  #
#                                                                                               	  #
#  To start the script, run:                                                                     	  #
#  /usr/bin/fan-boost-notification-git/FanNotifications.sh                                                #
#                                                                                               	  #
######################################################################################################
"
}

