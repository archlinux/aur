# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# Source: https://github.com/nicoulaj/archlinux-packages
pkgname=mvnsh
pkgver=1.0.1
pkgrel=1
pkgdesc="Interactive CLI interface for Apache Maven."
arch=(i686 x86_64)
url="http://shell.sonatype.org"
license=('EPL')
depends=('java-environment>=5' 'bash')
changelog=Changelog
source=(http://search.maven.org/remotecontent?filepath=org/sonatype/maven/shell/dist/mvnsh-assembly/$pkgver/mvnsh-assembly-$pkgver-bin.tar.gz)
md5sums=('5b0f47c8838aa7525f454f2bca9dbed9')

package() {
  msg2 "Install the assembly at /usr/share/java/${pkgname}..."
  install -dm755                                  ${pkgdir}/usr/share/java/${pkgname}
  cp -r ${srcdir}/${pkgname}-${pkgver}/* ${pkgdir}/usr/share/java/$pkgname

  msg2 "Install links to documentation resources at /usr/share/doc/${pkgname}..."
  install -dm755                              ${pkgdir}/usr/share/doc/${pkgname}
  ln -s /usr/share/java/${pkgname}/README.txt ${pkgdir}/usr/share/doc/${pkgname}/
  ln -s /usr/share/java/${pkgname}/examples   ${pkgdir}/usr/share/doc/${pkgname}/

  msg2 "Install links to copyright resources at /usr/share/licenses/${pkgname}..."
  install -dm755                          ${pkgdir}/usr/share/licenses/${pkgname}
  ln -s /usr/share/java/${pkgname}/LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/
  ln -s /usr/share/java/${pkgname}/NOTICE.txt  ${pkgdir}/usr/share/licenses/${pkgname}/

  msg2 "Install links to executables in /usr/bin..."
  # NOTE The package provides 'mvnsh', 'mvn' and 'mvnDebug', but only
  #      'mvnsh' is symlinked. Should the other ones too ? This would
  #      make the package provide+conflict with 'maven' and 'maven2'.
  install -dm755                             ${pkgdir}/usr/bin
  ln -s /usr/share/java/${pkgname}/bin/mvnsh ${pkgdir}/usr/bin/
}

# vim:set ts=2 sw=2 et:
