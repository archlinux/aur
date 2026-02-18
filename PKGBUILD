# Maintainer: Naatje80 <spekbukkem@gmail.com>
pkgname=rvgl-arcade-tracks
pkgver=1.0.0
pkgrel=1
pkgdesc="RVGL add-on for the additional tracks available in the arcade version of Re-Volt"
arch=('any')
url="https://re-volt.io/articles/arcade"
license=('MIT')
depends=('rvgl-basic')
source=("https://files.re-volt.io/arcade/tracks/OVALTRACK.zip" "https://files.re-volt.io/arcade/tracks/nhood0.zip" "https://files.re-volt.io/arcade/tracks/ship0.zip" "https://files.re-volt.io/arcade/tracks/venicearcade.zip")
build() {
  cd "$srcdir/$_pkgname" 
  
  # RVGL currently support only lower case files and directories
  for DIR in `find . -mindepth 1 -type d`
  do 
	  NEWDIR=$(echo ${DIR}|tr '[:upper:]' '[:lower:]')
	  if [[ ! -d ${NEWDIR} ]]
	  then
		  mv ${DIR} ${NEWDIR}
	  fi
  done
  for FILE in `find . -type f`
  do 
	  NEWFILE=$(echo $FILE|tr '[:upper:]' '[:lower:]')
	  if [[ ! -f ${NEWFILE} ]]
	  then
	  	mv ${FILE} ${NEWFILE} 
	  fi
  done

  # Fix ovaltrack to use correct mp3 track (Overdrive as mentioned in the comments of the overtrack.inf config file)
  sed -i -e 's/REDBOOK\t\t10 10/REDBOOK\t\t8 8/' levels/ovaltrack/ovaltrack.inf 
}
package(){
  cd "$srcdir/$_pkgname"
  mkdir -p ../pkg/$pkgname/opt/rvgl
  find . -maxdepth 1 -mindepth 1 -type d -exec cp -r '{}' ../pkg/$pkgname/opt/rvgl \;
}   
sha256sums=('937d1b17bbd8320cf8b55a069e736d454db7609e20a4d8b853e665020a542ee0'
            '2d5ab5385a86725e3aace3329cec1a16d2de2e5fe3ffe67dbef4f66589ccfc80'
            'd86e82b05c93fe5390994af441192e8e6d80d9f06c976cd0d860b5f931e38279'
            '6383f29c5e352d16cbba700d5413066c9aba0f1466614ae94c9d0f8491632ec3')
