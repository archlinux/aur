# Maintainer: mawcomw <mawcomw@gmail.com>

pkgname=redmine
pkgver=3.4.5
pkgrel=0
pkgdesc="A flexible project management web application. Written using the Ruby on Rails, it is cross-platform and cross-database."
arch=('any')
url="http://www.redmine.org"
license=('GPL2')
#makedepends=('glibc' 'dialog')
depends=('ruby>=1.9.3')
optdepends=(
	'rvm: a command line tool to easily manage multiple Ruby environments'
	'rbenv: another command line tool to easily manage multiple Ruby environments'
	'apache: a supported application server'
	'nginx: a supported application server'
	'tomcat7: a supported application server'
	'tomcat8: a supported application server'
	'mariadb: MariaDB database support'
	'mysql: MySQL database support'
	'postgresql: PostgreSQL database support'
	'git: Git repository browsing'
	'subversion: Subversion repository browsing'
	'darcs: Darcs repository browsing'
	'bzr: Bazaar repository browsing'
	'mercurial: Mercurial repository browsing'
	'cvs: CVS repository browsing'
	'imagemagick: Image export support for Gantt'
	'rails-ruby: alternative Ruby on Rails instalation'
)
provides=('redmine')
conflicts=('redmine')
backup=(
	'usr/share/webapps/redmine/config/configuration.yml'
	'usr/share/webapps/redmine/config/additional_environment.rb'
	'usr/share/webapps/redmine/config/database.yml'
)
source=("http://www.redmine.org/releases/$pkgname-$pkgver.tar.gz")
sha256sums=('53612ab3fa4eb1e4da6343e3dcb72c3f4f1b2cb55ed51dd8a6b89d9675714a6d')

package() {
	_instdir=$pkgdir/usr/share/webapps/redmine

	cd $srcdir/redmine-$pkgver

	# install in /usr/share/webapps
	install -dm 644 $_instdir
	cp -dr --no-preserve=ownership . $_instdir

	# create required directories
	install -dm 644 $_instdir/public/plugin_assets
	install -dm 644 $_instdir/tmp/pdf
	install -dm 644 $_instdir/files
	install -dm 644 $_instdir/log
	
	# set the http server user:group that will run the application
	#chgrp -R http $_instdir
}
