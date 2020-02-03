# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=scheduler
pkgver=1.2.0
pkgrel=1
pkgdesc="Alarms and reminders: tasks, events, calendar, pomodoro and timer widgets"
arch=('any')
url="https://github.com/j4321/Scheduler"
license=('GPL3')
makedepends=('python-setuptools')
depends=('tk' 'gettext' 'desktop-file-utils' 'python-matplotlib'
         'python-numpy' 'python-pillow' 'python-ewmh' 'python-babel'
         'python-tkcalendar' 'python-apscheduler' 'python-sqlalchemy'
         'python-dateutil' 'mpg123')
optdepends=('tktray: GUI toolkit for the system tray icon (at least one must be installed)'
            'pygtk: GUI toolkit for the system tray icon (at least one must be installed)'
            'python-pyqt5: GUI toolkit for the system tray icon (at least one must be installed)'
            'python-pyqt4: GUI toolkit for the system tray icon (at least one must be installed)'
            'python-pyside: GUI toolkit for the system tray icon (at least one must be installed)'
            'libnotify: desktop notifications'
            'zenity: nicer color chooser and file browser'
            'python-tkcolorpicker: nicer color chooser'
            'python-tkfilebrowser: nicer file browser')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/j4321/Scheduler/archive/v${pkgver}.tar.gz")
sha512sums=('c762811b18bbdd503213c9a1e252c63bf0c46c0938c8f83d4b2d0d574b654e70a97b0faa040487c05366a9367b2a8e495bd2dfa54908da652d3e8996c955206c')
install="$pkgname".install

build() {
	cd "$srcdir/Scheduler-${pkgver}"
	python setup.py build
}

package() {
	cd "$srcdir/Scheduler-${pkgver}"
	python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1 --skip-build
	install -d -m755 "$pkgdir/usr/lib/systemd/system"
	install -m644 scheduler@.service "$pkgdir/usr/lib/systemd/system/"
}
