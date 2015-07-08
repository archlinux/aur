# Contributor: Leo von Klenze <leo.vonklenze@tngtech.com> 
pkgname="atlassian-plugin-sdk"
pkgver=5.0.13
pkgrel=4
pkgdesc="Atlassian Plugin SDK for Developing Plugins for Atlassian Products"
arch=('i686' 'x86_64')
url="http://confluence.atlassian.com/x/rwWzDQ"
license=('Apache License 2.0')
source=("https://maven.atlassian.com/public/com/atlassian/amps/atlassian-plugin-sdk/$pkgver/atlassian-plugin-sdk-$pkgver.tar.gz")
md5sums=('b1681e60e2d75a2511f005dd7e91a323')
depends=(jdk)

package()
{
	cd "$pkgdir"
	mkdir -p opt/atlassian/plugin-sdk

	cp -r "$srcdir"/atlassian-plugin-sdk-$pkgver/* opt/atlassian/plugin-sdk

	# remove executable flag from .bat in bin
	chmod -x opt/atlassian/plugin-sdk/apache-maven-*/bin/*.bat

	# add executable flag for every user
	chmod -R +X opt/atlassian/plugin-sdk

    # add sun jasva path settings to atlas files
    #find opt/atlassian/plugin-sdk -type f -executable -exec sed -ie 's/# Execute Maven #/# Execute Maven #\nsource \/opt\/java7\/etc\/profile.d\/jdk.sh/g' {} \;

	# update PATH
	mkdir -p etc/profile.d
	echo 'export PATH=$PATH:/opt/atlassian/plugin-sdk/bin' > etc/profile.d/atlassian-plugin-sdk.sh
	echo 'setenv PATH ${PATH}:/opt/atlassian/plugin-sdk/bin' > etc/profile.d/atlassian-plugin-sdk.csh
	chmod +x etc/profile.d/*
}

