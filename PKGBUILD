# Maintainer: Alan Jenkins <alan.james.jenkins@gmail.com>

# Creator Amazon Web Services: https://aws.amazon.com/
# _commit=76fea495eda10a2a7edef93609d176ac141c648e
pkgname=aws-ssm-session-manager-plugin
pkgver=1.1.35.0
pkgrel=1
pkgdesc="The AWS Systems Manager - Session Manager Plugin"
arch=('x86_64')
url="https://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager-working-with.html"
license=('unknown')
depends=()
provides=(aws-ssm-session-manager-plugin)
source=("session-manager-plugin-$pkgver-$pkgrel.deb::https://s3.amazonaws.com/session-manager-downloads/plugin/latest/ubuntu_64bit/session-manager-plugin.deb")
sha256sums=('4361bd8bf6ad7c61ebec38577a01e2db4b1f2b126d99a05e83aa6dbb647e2907')
install=$pkgname.install

# Build the package
package() {

	### Extract the deb
	ar xv session-manager-plugin.deb

	### Extract the data
	bsdtar xfz data.tar.gz

	chmod -R g-w etc
	mv etc "${pkgdir}"

	chmod -R g-w usr
  mkdir -p usr/bin
  ln -s /usr/local/sessionmanagerplugin/bin/session-manager-plugin usr/bin/session-manager-plugin
	mv usr "${pkgdir}"

	chmod -R g-w lib
	mv lib "${pkgdir}/usr/lib"

}
