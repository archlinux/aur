# Maintainer: Philipp Wolfer <ph.wolfer@gmail.com>

pkgname=webcam-access-monitor
pkgver=0.1.4
pkgrel=1
pkgdesc="D-Bus service and Gnome Shell extension to monitor webcam access."
arch=('any')
url="https://github.com/phw/webcam-access-monitor"
license=('GPL3')
depends=('python' 'python-pyinotify' 'python-gobject' 'python-dbus' 'psmisc')
optdepends=('gnome-shell')
makedepends=()
source=("git://github.com/phw/webcam-access-monitor.git#tag=${pkgver}")
md5sums=('SKIP')
_gitname=$pkgname

package() {
  # The git repository does not yet include an install script by itself
  # so we put everything in place by hand for now.
  cd "$_gitname"
  _site_packages=`python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())"`

  install -d "${pkgdir}"/usr/share/gnome-shell/extensions/webcam-access-monitor@philipp.wolfer.co
  install gnome-shell-extension/* "${pkgdir}"/usr/share/gnome-shell/extensions/webcam-access-monitor@philipp.wolfer.co
  install -D service/com.uploadedlobster.WebcamAccessMonitor.service "${pkgdir}"/usr/share/dbus-1/services/com.uploadedlobster.WebcamAccessMonitor.service
  install -D service/webcam-access-monitor.py "${pkgdir}"/usr/lib/webcam-access-monitor/webcam-access-monitor.py
  install -d "${pkgdir}${_site_packages}"/webcamaccessmonitor
  install service/webcamaccessmonitor/* "${pkgdir}${_site_packages}"/webcamaccessmonitor
}
