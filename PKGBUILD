# Maintainer: JUXT <info@juxt.pro>
# Contributor: James Conroy-Finn <james@invetica.co.uk>
pkgname=codedeploy-agent
pkgver=1.0_1.1458
pkgrel=1
pkgdesc="AWS CodeDeploy is a deployment service that enables developers to automate the deployment of applications to instances and to update the applications as required."
arch=('i686' 'x86_64')
url="https://aws.amazon.com/documentation/codedeploy/"
license=('APACHE')
groups=()
depends=('ruby')
source=(https://aws-codedeploy-eu-west-1.s3-eu-west-1.amazonaws.com/releases/${pkgname}_${pkgver//_/-}_all.deb)
md5sums=('78540a9e2fa0f79820a3b2b7ca998e45')
noextract=()

prepare() {
  cd "$srcdir"
  tar -xf data.tar.gz
}

package() {
  cd "$srcdir"

  install -dm755 "$pkgdir"/opt/
  cp -R "${srcdir}"/opt/codedeploy-agent "${pkgdir}/opt/"

  install -Dm744 \
      "$srcdir"/etc/codedeploy-agent/conf/codedeployagent.yml \
      "$pkgdir"/etc/codedeploy-agent/conf/codedeployagent.yml

  install -Dm744 \
      "$srcdir"/etc/init.d/codedeploy-agent.service \
      "$pkgdir"/usr/lib/systemd/system/codedeploy-agent.service
}

# vim:set ts=2 sw=2 et:
