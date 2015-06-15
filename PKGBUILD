
# Maintainer: mawcomw <mawcomw@gmail.com>

pkgname=redmine
pkgver=3.0.2
pkgrel=1
pkgdesc="A flexible project management web application. Written using the Ruby on Rails, it is cross-platform and cross-database."
arch=('any')
url="http://www.redmine.org"
license=('GPL2')
#makedepends=('glibc' 'dialog')
#checkdepends=()
#depends=('ruby')
optdepends=('ruby: a dynamic, interpreted, open source programming language'
			'rvm: a command line tool to easily manage multiple Ruby environments'
			'rbenv: another command line tool to easily manage multiple Ruby environments'
			'apache: a supported application server'
			'nginx: a supported application server'
			'tomcat6: a supported application server'
			'tomcat7: a supported application server'
			'mariadb: MariaDB database support'
			'mysql: MySQL database support'
			'postgresql: PostgreSQL database support'
			'git: Git repository browsing'
			'subversion: Subversion repository browsing'
			'darcs: Darcs repository browsing'
			'bzr: Bazaar repository browsing'
			'mercurial: Mercurial repository browsing'
			'cvs: CVS repository browsing'
			'imagemagick: Image export support for Gantt')
provides=('redmine')
#conflicts=()
#replaces=()
backup=('usr/share/webapps/redmine/config/configuration.yml'
	'usr/share/webapps/redmine/config/database.yml')
#options=()
#install=redmine.install
#changelog
source=("http://www.redmine.org/releases/$pkgname-$pkgver.tar.gz")
#noextract
md5sums=('edc27c4de4e8ac52f669883617d4dd5d')
#sha1sums=()
#sha256sums=()
#sha384sums=()
#sha512sums=()

build() {
	return 0
}

package() {
	_redmine_installation_path="/usr/share/webapps/redmine"
	cd "$srcdir/redmine-$pkgver"

	# install in /usr/share/webapps
	_instdir="$pkgdir/${_redmine_installation_path}"
	mkdir -p ${_instdir}
	cp -ra . ${_instdir}

	# create required directories
	mkdir -p "${_instdir}/public/plugin_assets"
	#mkdir -p "${_instdir}/tmp/pdf"
	#mkdir -p "${_instdir}/files"
	#mkdir -p "${_instdir}/log"
	
	# set the group that will run the http server to have write permission (for apache it should be http)
	chmod -R g+w "${_instdir}/tmp"
	chmod g+w "${_instdir}/files"
	chmod g+w "${_instdir}/log"
	
	# set the http server user:group that will run the application
	#chgrp -R http ${_instdir}

	# Create systemd service
	#mkdir -p "$pkgdir/usr/lib/systemd/system/"
	#install -m 644 "$srcdir/redmine.service" "$pkgdir/usr/lib/systemd/system/"
}
