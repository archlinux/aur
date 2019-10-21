# Maintainer: Alexandr B <4le34n at gmail dot com>

pkgname=nfsen
pkgver=1.3.8
pkgrel=33
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
backup=('etc/nfsen/nfsen.conf')
install='install'
source=("$url/files/stable/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz"
        'create_top_directions'
        'create_top_protocols'
        'nfsen.conf'
        'nginx'
        'ports.desc'
        'profile.sh'
        'README.pkg'
        'scripts.conf'
        'service'
        'sysusers'
        'tmpfiles')

prepare() {
	cd "${pkgname}-${pkgver}"
        # Fix error
        sed -i 's|$rrd_version < 1.6|$rrd_version < 1.7|' libexec/NfSenRRD.pm
}

package() {
	install -dm755 "${pkgdir}/usr/share/webapps" 
        cp -a "${pkgname}-${pkgver}" "${pkgdir}/usr/share/webapps/${pkgname}"
	cd "${pkgname}-${pkgver}"
	install -Dm644 "${srcdir}/service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service" 
	install -Dm644 "${srcdir}/sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf" 
	install -Dm644 "${srcdir}/tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf" 
	install -Dm644 BSD-license.txt "${pkgdir}/usr/share/licenses/${pkgname}/BSD-license.txt" 
	install -Dm644 ChangeLog "${pkgdir}/usr/share/doc/${pkgname}/ChangeLog" 
	install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname}/README" 
	install -Dm644 README.plugins "${pkgdir}/usr/share/doc/${pkgname}/README.plugins" 
	install -Dm644 "${srcdir}/${pkgname}.conf" "${pkgdir}/etc/${pkgname}/${pkgname}.conf"
	install -Dm644 "${srcdir}/ports.desc" "${pkgdir}/etc/${pkgname}/ports.desc"
	install -Dm644 "${srcdir}/nginx" "${pkgdir}/usr/share/doc/${pkgname}/vhost-nginx.conf"
	install -Dm644 "${srcdir}/README.pkg" "${pkgdir}/usr/share/doc/${pkgname}/README.pkg"
	install -Dm755 "${srcdir}/profile.sh" "${pkgdir}/etc/profile.d/${pkgname}.sh"
	install -Dm644 "${srcdir}/scripts.conf" "${pkgdir}/etc/${pkgname}/scripts.conf"
	install -Dm755 "${srcdir}/create_top_directions" "${pkgdir}/opt/${pkgname}/bin/create_top_directions"
	install -Dm755 "${srcdir}/create_top_protocols" "${pkgdir}/opt/${pkgname}/bin/create_top_protocols"
}

md5sums=('fc45b3f44a66c2ed65d1269e479c2414'
         '7ce142a55af2e18d5db8e419dcc85d3d'
         '106f4e354e42d44e64d24d7e16ca8b4a'
         'c89ea74798910da5992cfc74d5d81444'
         'e8ffd8c767aca866050d679b609a0db9'
         '69d219f123963071f89f3d55cda489d9'
         'ad1b4a004dacd0508033fcfca763a2fe'
         '19e7acd1c98f32009de6541f4e5e39f9'
         'ba000ec98e02b4baec2afd9aa5f52854'
         '69898397995d35b1d53d6a61b16b24a8'
         '4590eab9fea0b468b47155e849e16678'
         '7f691fde1b2c423fbc7cadf42f08c236')
