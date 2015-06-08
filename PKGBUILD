# Maintainer: Rubens Brandão <construidor[at]gmail[dot]com>
pkgname=mosix
pkgver=4.2.1
pkgrel=1
pkgdesc="MOSIX can manage Linux clusters and multi-cluster private Clouds."
url="http://www.mosix.cs.huji.ac.il"
arch=('x86_64')
license=('custom:Mosix')
depends=('glibc')
optdepends=('lzop')
makedepends=()
conflicts=('mosix-tools' 'linux-mosix' 'linux-mosix-headers')
replaces=()
backup=()
source=(
		"http://www.mosix.cs.huji.ac.il/mos4/MOSIX-${pkgver}.tbz"
		'mosix.service'
		)
sha256sums=(
		'4a44188355d6f52947cf583ee9b96b597c7a31074abb9095f1b014f1a38222b6'
		'b216039d8eefab0e54200ef1a393f8f10c1aa7d630d1e83865c27f39dd45b8fd'
		)



package() {	
  cd "${srcdir}/${pkgname}-${pkgver}"
	
  install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  mkdir -p "${pkgdir}/usr/share/man/"
  cp -ra man/* "${pkgdir}/usr/share/man/"
  
  for file in mos_autoconf mos_checkconf mos_in_job mosconf* mosd mosixd mospostald mosremoted mossetpe mosmon mosnative mospipe mostestload mosenv mosctl
  do
	install -D -m 755 "${file}" "${pkgdir}/usr/bin/${file}"
  done
  
  for file in moskillall mosmigrate mosps mosrun mosbestnode mostimeof
  do
	install -D -m 755 "${file}" "${pkgdir}/usr/bin/${file}"
	chmod u+s "${pkgdir}/usr/bin/${file}"
  done
  
  install -D -m 644 "${srcdir}/mosix.service" "${pkgdir}/usr/lib/systemd/system/mosix.service"

  mkdir -p -m 755 "${pkgdir}/etc/mosix/partners"
  mkdir -p -m 755 "${pkgdir}/var/mosix"
  ln -s "/var/mosix" "${pkgdir}/etc/mosix/var"
  

}

# vim:set ts=2 sw=2 et:
