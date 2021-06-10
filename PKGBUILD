# Maintainer: Tobias Müller <mintuser17 at gmail dot com> (Package Maintainer)
# Contributor: Markus Hadenfeldt <support at teaspeak dot de> (Program Maintainer)

pkgname=teaspeak-server
pkgver=1.5.6
pkgrel=1
pkgdesc="Set up your own Teaspeak Server for the Teaspeak Client."
arch=('x86_64')
url='https://teaspeak.de/gb'
license=("custom:${pkgname}")
depends=('nss'
	 'ffmpeg')
install=.install
source=("https://repo.teaspeak.de/server/linux/amd64_stable/TeaSpeak-1.5.6.tar.gz")
sha256sums=('50ddd39e59c075137371ccde4c26c5930b33cc3a326230bd93d442efc57b7c9c')

package() {

  mkdir -p ${pkgdir}/opt/${pkgname}
  cd .. && install -Dm644 teaspeak-server.service -t "${pkgdir}/etc/systemd/system/"
  cp -r ${srcdir}/* ${pkgdir}/opt/${pkgname}
  rm ${pkgdir}/opt/${pkgname}/TeaSpeak-*

  echo ""
  echo "+---------------------------------------------------------------------+"
  echo -e "\e[32m The TeaSpeak-server files will be installed in /opt/${pkgname}! \e[0m"
  echo -e "\e[32m You have the possibility to start this server via systemd. \e[0m"
  echo ""
  echo -e "\e[32m systemctl enable | disable | start | stop | restart | status teaspeak-server.service \e[0m"
  echo ""
  echo -e "\e[32m But before you do, please run the ´teastart_minimal.sh´ script in terminal \e[0m"
  echo -e "\e[32m (which is located in /opt/${pkgname}) \e[0m"
  echo -e "\e[32m You will get a Token-key, which is important. Open the client of teaspeak, \e[0m"
  echo -e "\e[32m connect to your localhost server, and type in the key. After these steps, \e[0m"
  echo -e "\e[32m you can edit your server, if you want and your TeaSpeak Server is ready. \e[0m"
  echo ""
  warning "Please change the ´User´ in /etc/systemd/system/teaspeak-server.service!!! - For security reasons!"
  echo ""
  echo "+---------------------------------------------------------------------+"
  echo ""
 
  chmod 750 ${pkgdir}/opt/${pkgname}
  chmod 750 ${pkgdir}/opt/${pkgname}/certs
  chown -R $USER:$USER ${pkgdir}/opt/${pkgname}
  
}




