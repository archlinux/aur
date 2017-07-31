# Maintainer: Alexandr B <4le34n at gmail dot com>

pkgname=nfsen
pkgver=1.3.8
pkgrel=4
pkgdesc="Netflow visualisation and investigation tool"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/nfsen"
license=('BSD')
depends=('nfdump>=1.6.1'
         'perl>=5.10.1'
         'perl-mailtools'
         'perl-socket6'
         'php>4.1' 
         'rrdtool')
optdepends=('apache' 'nginx' 'php-apache' 'php-fpm')
backup=('etc/nfsen.conf')
source=("$url/files/stable/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz"
        'conf.php'
        'nfsen.conf'
        'nginx'
        'profile.csh'
        'profile.sh'
        'service'
        'tmpfiles')
install='install'

package() {
	cd "$pkgname-$pkgver"

        install -d "$pkgdir/opt/$pkgname/plugins"
        install -d "$pkgdir/usr/share/webapps/$pkgname/plugins"
        install -d "$pkgdir/var/lib/nfsen/filters"
        install -d "$pkgdir/var/lib/nfsen/fmt"
        install -d "$pkgdir/var/lib/nfsen/profiles-stat"
        install -d "$pkgdir/var/lib/nfsen/profiles-data"
        
        cp -a bin "$pkgdir/opt/$pkgname"
        cp -a libexec "$pkgdir/opt/$pkgname"
        cp -a plugins/backend/* "$pkgdir/opt/$pkgname/plugins"
        cp -a contrib/PortTracker/PortTracker.pm "$pkgdir/opt/$pkgname/plugins"
        cp -a plugins/PluginTemplate.pm "$pkgdir/opt/$pkgname/plugins"
        cp -a plugins/frontend/* "$pkgdir/usr/share/webapps/$pkgname/plugins"
        cp -a contrib/PortTracker/PortTracker.php "$pkgdir/usr/share/webapps/$pkgname/plugins"
        cp -a ./html/* "$pkgdir/usr/share/webapps/$pkgname"
        
        chown http:http ${pkgdir}/usr/share/webapps/$pkgname # write access for http user
	
        install -Dm644 "$srcdir/service" "$pkgdir/usr/lib/systemd/system/nfsen.service" 
	install -Dm644 "$srcdir/tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/nfsen.conf" 
	install -Dm644 BSD-license.txt "$pkgdir/usr/share/license/$pkgname/BSD-license.txt" 
	install -Dm644 ChangeLog "$pkgdir/usr/share/doc/$pkgname/ChangeLog" 
	install -Dm644 README "$pkgdir/usr/share/doc/$pkgname/README" 
	install -Dm644 README.plugins "$pkgdir/usr/share/doc/$pkgname/README.plugins" 
	install -Dm644 "$srcdir/nfsen.conf" "$pkgdir/etc/nfsen.conf"
	install -Dm644 "$srcdir/nginx" "$pkgdir/etc/nginx/sites-available/$pkgname"
	install -Dm644 "$srcdir/conf.php" "$pkgdir/usr/share/webapps/$pkgname/conf.php"
	install -Dm755 "$srcdir/profile.csh" "$pkgdir/etc/profile.d/$pkgname.csh"
	install -Dm755 "$srcdir/profile.sh" "$pkgdir/etc/profile.d/$pkgname.sh"
}
md5sums=('fc45b3f44a66c2ed65d1269e479c2414'
         'e20fa07965015842d476c54b9df7829e'
         'fa81120f06b2dbcfc97c73c06b0718f6'
         'e8ffd8c767aca866050d679b609a0db9'
         'fbb536ddcc39810079c10bef1cfd969f'
         'b0a7cf11d83c24c8b39d223fbac17b93'
         '69898397995d35b1d53d6a61b16b24a8'
         'd60d7334fb00e85ea3230f059ae660aa')
